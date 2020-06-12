import 'dart:ui';

import 'package:botique/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets(("Should display main Image when Splash is opened"), (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SplashPage(),
    ));
    final mainImage = find.byType(Image);
    await tester.pump(Duration(seconds: 3));
    expect(mainImage, findsOneWidget);
  });
}