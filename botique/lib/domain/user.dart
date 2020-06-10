import 'dart:convert' as convert;

import 'package:botique/utils/prefs.dart';

class User {
  String login;
  String name;
  String email;
  String urlFoto;
  String id;

  User({
    this.login,
    this.name,
    this.email,
    this.urlFoto,
    this.id
  });

  User.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    name = json['nome'];
    email = json['email'];
    urlFoto = json['urlFoto'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['nome'] = this.name;
    data['email'] = this.email;
    data['urlFoto'] = this.urlFoto;
    data['id']= this.id;
    return data;
  }

  static void clear() {
    Prefs.setString("user.prefs", "");
  }

  void save() {
    Map map = toJson();

    String json = convert.json.encode(map);

    Prefs.setString("user.prefs", json);
  }

  static Future<User> get() async {
    String json = await Prefs.getString("user.prefs");
    if (json.isEmpty) {
      return null;
    }
    Map map = convert.json.decode(json);
    User user = User.fromJson(map);
    return user;
  }

  @override
  String toString() {
    return 'User{login: $login, name: $name, email: $email, urlFoto: $urlFoto, id: $id}';
  }
}
