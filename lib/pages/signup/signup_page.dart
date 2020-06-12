import 'package:botique/bloc/signup/signup_bloc.dart';
import 'package:botique/firebase/firebase_service.dart';
import 'package:botique/network/api_response.dart';
import 'package:botique/pages/home/home_page.dart';
import 'package:botique/resources/strings.dart';
import 'package:botique/utils/navigation.dart';
import 'package:botique/utils/validator.dart';
import 'package:botique/widgets/app_alert.dart';
import 'package:botique/widgets/app_button.dart';
import 'package:botique/widgets/app_inputtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _tName = TextEditingController();
  final _tEmail = TextEditingController();
  final _tPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _focusPassword = FocusNode();
  final _focusEmail = FocusNode();
  SignUpBloc _signUpBloc = SignUpBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        resizeToAvoidBottomPadding: true,
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
                Strings.name,
                Strings.insertName,
                textEditingController: _tName,
                textCapitalization: TextCapitalization.words,
                validator: validateName,
                action: TextInputAction.next,
                keyboardType: TextInputType.text,
                nextFocus: _focusEmail,
              ),
              SizedBox(
                height: 16,
              ),
              AppInputText(
                Strings.email,
                Strings.insertEmail,
                textEditingController: _tEmail,
                validator: validateEmail,
                keyboardType: TextInputType.emailAddress,
                focusNode: _focusEmail,
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
                height: 32,
              ),
              StreamBuilder<bool>(
                stream: _signUpBloc.stream,
                initialData: false,
                builder: (context, snapshot) {
                  return AppButton(
                    Strings.singUp,
                    onPressed: _onClickSignUp,
                    showProgress: snapshot.data,
                  );
                },
              ),
              SizedBox(
                height: 16,
              ),
              AppButton(
                Strings.cancel,
                color: Colors.white,
                textColor: Colors.deepPurpleAccent,
                onPressed: () => _onClickCancel(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onClickSignUp() async {
    if (!_formKey.currentState.validate()) return;

    ApiResponse response =
        await _signUpBloc.signUp(_tName.text, _tEmail.text, _tPassword.text);

    if (response.ok) {
      pop(context);
      push(context, HomePage(), replace: true);
    } else {
      alert(context, response.msg);
    }
  }

  String validateField(String value) {
    if (value.isEmpty) {
      return Strings.insertAText;
    }
    return null;
  }

  _onClickCancel() {
    pop(context);
  }

  @override
  void dispose() {
    super.dispose();
    _signUpBloc.dispose();
  }
}
