class Like {
  int? id;
  int? article;
  int? user;
  DateTime? date;

  Like({this.id, this.article, this.user, this.date});

  Like.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    article = json['article'];
    user = json['user'];
    date = DateTime.parse(json['date']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['article'] = this.article;
    data['user'] = this.user;
    data['date'] = this.date;
    return data;
  }
}