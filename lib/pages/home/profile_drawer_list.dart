import 'package:botique/domain/user.dart';
import 'package:botique/firebase/firebase_service.dart';
import 'package:botique/pages/signup/login_page.dart';
import 'package:botique/utils/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfileDrawerList extends StatelessWidget {
  String email;
  String name;
  String profilePicture;

  ProfileDrawerList(
      {this.email = "", this.name = "", this.profilePicture = ""});

  @override
  Widget build(BuildContext context) {
    Future<User> future = User.get();

    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            FutureBuilder<User>(
              future: future,
              builder: (context, snapshot) {
                User user = snapshot.data;
                return user != null ? _header(user) : Container();
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => _onClickLogout(context),
            )
          ],
        ),
      ),
    );
  }

  UserAccountsDrawerHeader _header(User user) {
    return UserAccountsDrawerHeader(
      accountName: Text(user.name ?? ""),
      accountEmail: Text(user.email),
      currentAccountPicture: user.urlFoto != null
          ? CircleAvatar(
              backgroundImage: NetworkImage(user.urlFoto),
            )
          : CircleAvatar(backgroundImage: AssetImage("assets/images/jotaro.jpg"),

            ),
    );
  }

  _onClickLogout(BuildContext context) {
    FirebaseService().logout();
    pop(context);
    push(context, LoginPage(), replace: true);
  }
}
