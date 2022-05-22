class User {
  int? id;
  String? email;
  String? name;
  String? image;
  bool? admin;
  String? password;
  String? re_password;

  User({this.id, this.email, this.name, this.image, this.admin=false, this.password, this.re_password});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    image = json['image'];
    admin = json['admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['name'] = this.name;
    data['image'] = this.image;
    data['password'] = this.password;
    data['re_password'] = this.re_password;
    return data;
  }
}