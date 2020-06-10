import 'package:botique/pages/signup/login_page.dart';
import 'package:botique/resources/strings.dart';
import 'package:botique/utils/navigation.dart';
import 'package:botique/widgets/app_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home/home_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Future future = Future.delayed(Duration(seconds: 3));

    // Usuario
    Future<FirebaseUser> futureFirebase = FirebaseAuth.instance.currentUser();

    Future.wait([future, futureFirebase]).then((List values) {
      FirebaseUser user = values[1];
      print(user);

      if (user != null) {
        push(context, HomePage(), replace: true);
      } else {
        push(context, LoginPage(), replace: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _body(),
    );
  }

  _body(){
    return Container(
      child:  Container(
        color: Colors.purple,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListView(
                shrinkWrap: true,
                children: <Widget>[
                  text("Stand User: ${Strings.standUser}",fontSize: 20, bold: true),
                  text("Stand Name: ${Strings.standName}",fontSize: 20, bold: true),
                  text("User email: ${Strings.standUserEmail}",fontSize: 20, bold: true),
                  SizedBox(height:20),
                  Image.asset("assets/images/jojo.jpg"),
                ],
              ),


          ],
        ),
      ),
    );
  }
}
