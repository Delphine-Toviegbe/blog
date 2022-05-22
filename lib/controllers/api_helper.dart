import 'dart:convert';
import 'package:blog/models/article.dart';
import 'package:blog/models/category.dart';
import 'package:blog/models/comment.dart';
import 'package:blog/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class APIHelper {

  //Category methods
  static Future<List<Category>> getCategories() async {
    List<Category> categories = [];
    final response = await http.get(Uri.parse('http://flutterapp.pythonanywhere.com/blogs/category/'));
    if (response.statusCode == 200) {
      var results = json.decode(response.body);
      for(var item in results){
        categories.add(Category.fromJson(item));
      }
    } else {
      throw Exception('Failed to load categories');
    }
    return categories;
  }
  static Category getCategoryById(int id){
    Category category = Category();
    
    return category;
  }


  //Article methods
  static createArticle(Article article) async {
    final prefs = await SharedPreferences.getInstance();
    http.post(
      Uri.parse('http://flutterapp.pythonanywhere.com/blogs/article/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": "Bearer "+prefs.getString("refresh")!
      },
      body: jsonEncode(article.toJson()),
    );
  }
  static updateArticle(Article article) async {
    final prefs = await SharedPreferences.getInstance();
    http.patch(
      Uri.parse('http://flutterapp.pythonanywhere.com/blogs/article/'+article.id.toString()+'/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": "Bearer "+prefs.getString("refresh")!
      },
      body: jsonEncode(article.toJson()),
    );
  }
  static deleteArticle(Article article) async {
    final prefs = await SharedPreferences.getInstance();
    http.delete(
      Uri.parse('http://flutterapp.pythonanywhere.com/blogs/article/'+article.id.toString()+'/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": "Bearer "+prefs.getString("refresh")!
      },
    );
  }
  static Future<List<Article>> getArticles() async {
    List<Article> articles = [];
    final response = await http.get(Uri.parse('http://flutterapp.pythonanywhere.com/blogs/article/'));
    if (response.statusCode == 200) {
      var results = json.decode(response.body);
      for(var item in results){
        articles.add(Article.fromJson(item));
      }
    } else {
      throw Exception('Failed to load articles');
    }
    return articles;
  }
  static Future<Article> getArticleById(int id) async {
    Article article;
    final response = await http.get(Uri.parse('http://flutterapp.pythonanywhere.com/blogs/article/'+id.toString()));
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      article = Article.fromJson(result);
    } else {
      throw Exception('Failed to load articles');
    }
    return article;
  }
  static List<Article> getArticlesByCategory(Category category){
    List<Article> articles = [];
    return articles;
  }


  //Comment methods
  static void createComment(Comment comment){
  }
  static List<Comment> getCommentsByArticle(Article article){
    List<Comment> comments = [];
    return comments;
  }
  static int getCommentsCountByArticle(Article article){
    return 0;
  }


  //User methods
  static createUser(User user){

  }
  static User getUserById(int id){
    User user = User();
    return user;
  }
  static login(User user) async {
    final prefs = await SharedPreferences.getInstance();
    final response = await http.post(
      Uri.parse('http://flutterapp.pythonanywhere.com/accounts/auth/jwt/create/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(user.toJson()),
    );
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      prefs.setString("refresh", result['refresh']);
    } else {
      throw Exception('Failed to load articles');
    }
  }
  //this method returns the user if he is connected, otherwise it returns false
  static Future<User?> currentUser() async {
    User? user;
    final prefs = await SharedPreferences.getInstance();
    final response = await http.get(
      Uri.parse('http://flutterapp.pythonanywhere.com/accounts/auth/users/me/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": "Bearer "+prefs.getString("refresh")!
      }
    );
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      user = User.fromJson(result);
    }
    return user;
  }
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    http.post(
      Uri.parse('http://flutterapp.pythonanywhere.com/accounts/auth/logout/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": "Bearer "+prefs.getString("refresh")!
      },
      body: jsonEncode({"refresh": prefs.getString("refresh")!}),
    );
    prefs.setString("refresh", "");
  }


  //Like methods
  static int getLikesCountByArticle(Article article){
    return 0;
  }


  //Love methods
  static int getLovesCountByArticle(Article article){
    return 0;
  }

}