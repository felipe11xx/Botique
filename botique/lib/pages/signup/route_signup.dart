import 'package:botique/pages/signup/login_page.dart';
import 'package:botique/pages/signup/signup_page.dart';
import 'package:botique/resources/strings.dart';
import 'package:botique/utils/navigation.dart';
import 'package:botique/widgets/app_button.dart';
import 'package:flutter/material.dart';

class RouteSignUpPage extends StatefulWidget {
  @override
  _RouteSignUpPageState createState() => _RouteSignUpPageState();
}

class _RouteSignUpPageState extends State<RouteSignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.botique,
            textAlign: TextAlign.center,
        ),
      ),
      body: _body(),

    );
  }

  _body(){
    return Container(
      color: Colors.lime,
      padding: EdgeInsets.all(16),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize:  MainAxisSize.max,
        children: <Widget>[
         ListView(
              shrinkWrap: true,

              children: <Widget>[
                AppButton(Strings.singUp,color: Colors.green, onPressed: () => push(context, SignUpPage()),),
                SizedBox(
                  height: 16,
                ),
                AppButton(Strings.login, onPressed: () => push(context, LoginPage()),),
              ],
            ),
        ],
      ),
    );
  }
}
