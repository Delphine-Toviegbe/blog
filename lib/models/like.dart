class Like {
  int? id;
  int? article;
  int? user;
  DateTime? date;

  Like({this.id, this.article, this.user, this.date});

  Like.fromJson(Map<String, dynamic> json) {
    article = json['article']['id'];
    user = json['user']['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['article'] = this.article;
    return data;
  }
}