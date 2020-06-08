import 'package:botique/resources/strings.dart';
import 'package:botique/utils/validator.dart';
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
  bool _showProgress = false;

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
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        color: Colors.lime,
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
//            Padding(
//                padding: EdgeInsets.only(
//                    bottom: MediaQuery.of(context).viewInsets.bottom)),
            SizedBox(
              height: 32,
            ),
            AppButton(
              Strings.singUp,
              onPressed: () => _onClickSignUp(),
              showProgress: _showProgress,
            ),
          ],
        ),
      ),
    );
  }

  _onClickSignUp() async {
    if (!_formKey.currentState.validate()) return;
    String name = _tName.text;
    String email = _tName.text;
    String password = _tPassword.text;

    setState(() {
      _showProgress = true;
    });
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

  String validateField(String value) {
    if (value.isEmpty) {
      return Strings.insertAText;
    }
    return null;
  }
}
