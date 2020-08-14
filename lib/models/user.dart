import 'package:json_annotation/json_annotation.dart';
@JsonSerializable(explicitToJson: true)
class UserModel{
  String id;
  String name;
  String avatar;
  String email;
  String password;
  int createdAt;

  UserModel({this.id, this.name, this.avatar, this.email, this.password,
      this.createdAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
    email = json['email'];
    password = json['password'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['email'] = this.email;
    data['password'] = this.password;
    data['createdAt'] = this.createdAt;

    return data;
  }

  @override
  String toString() {
    return 'UserModel{id: $id, name: $name, avatar: $avatar, email: $email, password: $password, createdAt: $createdAt}';
  }
}