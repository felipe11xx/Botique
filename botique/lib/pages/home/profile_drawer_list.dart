
import 'package:botique/pages/signup/route_signup.dart';
import 'package:botique/resources/strings.dart';
import 'package:botique/utils/navigation.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfileDrawerList extends StatelessWidget {

  String email;
  String name;
  String profilePicture;

  ProfileDrawerList({this.email = "", this.name = "", this.profilePicture = ""});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(

      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text(name ),
          accountEmail: Text(email ),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(profilePicture ?? "https://i.pinimg.com/474x/6a/f3/29/6af32952636b69c6b3a3fb115ae1eb43.jpg"),
          )

        ),
        ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(Strings.logout),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              _onClickLogout(context);
            }),

      ],
    ));
  }

  _onClickLogout(BuildContext context) {
    pop(context);
    push(context, RouteSignUpPage(), replace: true);
  }
}
