import 'package:blog/models/article.dart';

class Category {
  int? id;
  String? name;
  List<Article> articles = [];

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    for(var item in json['articles']){
      articles.add(Article.fromJson(item));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
