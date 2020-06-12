import 'package:botique/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  testWidgets('Should display image when SplashScreen is opended', (WidgetTester tester) async{
    tester.pumpWidget(MaterialApp( home: SplashPage()));
  });

}