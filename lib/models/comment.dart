class Comment {
  int? id;
  int? article;
  int? user;
  DateTime? date;
  String? content;

  Comment({this.id, this.article, this.user, this.date, this.content});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    date = DateTime.parse(json['date']);
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['article'] = this.article;
    data['user'] = this.user;
    data['date'] = this.date;
    data['content'] = this.content;
    return data;
  }
}
