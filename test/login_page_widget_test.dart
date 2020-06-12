import 'package:botique/pages/signup/login_page.dart';
import 'package:botique/resources/strings.dart';
import 'package:botique/widgets/app_button.dart';
import 'package:botique/widgets/app_inputtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('Should have the main form when the LoginPage is opened',
      ( tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginPage()));
    final mainForm =  find.byType(Form);
    expect(mainForm, findsOneWidget);
  });

  testWidgets('Should display password inputs text when the LoginPage is opened',
          ( tester) async {
        await tester.pumpWidget(MaterialApp(home: LoginPage()));
        final passwordInput =  find.widgetWithText(AppInputText, Strings.password);
        expect(passwordInput, findsOneWidget);
      });

  testWidgets('Should display email inputs text when the LoginPage is opened',
          ( tester) async {
        await tester.pumpWidget(MaterialApp(home: LoginPage()));
        final emailInput =  find.widgetWithText(AppInputText, Strings.email);
        expect(emailInput, findsOneWidget);
      });

  testWidgets('Should display login button when the LoginPage is opened',
          ( tester) async {
        final appButton =  find.widgetWithText(AppButton, Strings.login);
        expect(appButton, findsOneWidget);
      });

}
