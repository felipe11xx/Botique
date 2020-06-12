import 'package:botique/bloc/signup/login_bloc.dart';
import 'package:botique/firebase/firebase_service.dart';
import 'package:botique/network/api_response.dart';
import 'package:botique/pages/home/home_page.dart';
import 'package:botique/pages/signup/signup_page.dart';
import 'package:botique/resources/strings.dart';
import 'package:botique/utils/navigation.dart';
import 'package:botique/utils/validator.dart';
import 'package:botique/widgets/app_alert.dart';
import 'package:botique/widgets/app_button.dart';
import 'package:botique/widgets/app_inputtext.dart';
import 'package:botique/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _tEmail = TextEditingController();
  final _tPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _focusPassword = FocusNode();
  LoginBloc _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Strings.botique),
        ),
        body: _body());
  }

  _body() {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
      child: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: <Widget>[
              AppInputText(
                Strings.email,
                Strings.insertLogin,
                textEditingController: _tEmail,
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
              StreamBuilder<bool>(
                stream: _loginBloc.stream,
                initialData: false,
                builder: (context, snapshot) {
                  return AppButton(
                    Strings.login,
                    onPressed: _onClickLogin,
                    showProgress: snapshot.data,
                  );
                },
              ),

              Container(
                  height: 46,
                  margin: EdgeInsets.only(top: 24),
                  child: InkWell(
                    onTap: _onClickSignUp,
                    child: text(
                      Strings.singUp,
                      fontSize: 22,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      textAlign: TextAlign.center,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  _onClickLogin() async {
    if (!_formKey.currentState.validate()) return;
    String email = _tEmail.text;
    String password = _tPassword.text;

    ApiResponse response = await _loginBloc.login(email, password);

    if (response.ok) {
      push(context, HomePage(), replace: true);
    } else {
      alert(context, response.msg);
    }
  }

  void _onClickSignUp() {
    push(context, SignUpPage());
  }

  @override
  void dispose() {
    super.dispose();
    _loginBloc.dispose();
  }


}
