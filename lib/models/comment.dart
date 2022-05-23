import 'package:blog/models/user.dart';

class Comment {
  int? id;
  int? article;
  User? user;
  String? date;
  String? content;

  Comment({this.id, this.article, this.user, this.date, this.content});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = User.fromJson(json['user']);
    date = json['date'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['article'] = this.article;
    data['content'] = this.content;
    return data;
  }
}
