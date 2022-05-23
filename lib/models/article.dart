import 'dart:convert';

class Article {
  int? id;
  DateTime? publishDate;
  String? title;
  List<dynamic>? content;
  int? user;
  int? category;
  int? like;
  int? love;

  Article({this.id, this.publishDate, this.title, this.content, this.user, this.category});

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    publishDate = DateTime.parse(json['publish_date']);
    title = json['title'];
    content = jsonDecode(json['content']);
    user = json['user']['id'];
    category = json['category']['id'];
    like = json['loves_likes']['like'];
    love = json['loves_likes']['love'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['publish_date'] = this.publishDate.toString();
    data['title'] = this.title;
    data['content'] = jsonEncode(this.content);
    data['user'] = this.user;
    data['category'] = this.category;
    return data;
  }
}