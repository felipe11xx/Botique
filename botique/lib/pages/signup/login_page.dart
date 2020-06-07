
import 'package:botique/pages/home/home_page.dart';
import 'package:botique/resources/strings.dart';
import 'package:botique/utils/navigation.dart';
import 'package:botique/utils/validator.dart';
import 'package:botique/widgets/app_button.dart';
import 'package:botique/widgets/app_inputtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _tLogin = TextEditingController();
  final _tPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _focusPassword = FocusNode();
  bool _showProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Strings.botique),
        ),
        body: _body());
  }

  _body() {
    return Form(
      key: _formKey,

      child:  Container(
        padding: EdgeInsets.all(16),
        color: Colors.lime,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               ListView(
                 shrinkWrap: true,
                children: <Widget>[
                  AppInputText(
                    Strings.login,
                    Strings.insertLogin,
                    textEditingController: _tLogin,
                    validator: validateEmail,
                    action: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    nextFocus: _focusPassword,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  AppInputText(Strings.password, Strings.insertPassword,
                      isPassword: true,
                      textEditingController: _tPassword,
                      validator: validatePassword,
                      keyboardType: TextInputType.number,
                      focusNode: _focusPassword),
                  SizedBox(
                    height: 20,
                  ),
                  AppButton(
                    Strings.login,
                    onPressed: () => _onClickLogin(),
                    showProgress: _showProgress,
                  ),]),
             ],
           ),
      ),

    );
  }

  _onClickLogin() async {
    if (!_formKey.currentState.validate()) return;
    String login = _tLogin.text;
    String password = _tPassword.text;

    setState(() {
      _showProgress = true;
    });

    push(context, HomePage());
//    ApiResponse response = await LoginApi.login(login, password);
//
//    if (response.ok) {
//      User user = response.result;
//      print("nome > $user");
//      push(context, HomePage(), replace: true);
//      setState(() {
//        _showProgress = false;
//      });
//    } else {
//      setState(() {
//        _showProgress = false;
//      });
//      alert(context, response.message);
//    }
  }


}
