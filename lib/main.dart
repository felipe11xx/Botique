import 'package:botique/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,

        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepPurple,
          cardColor: Colors.grey[200],
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          accentColor: Colors.deepPurpleAccent ,
          cursorColor: Colors.deepPurpleAccent,
          cardColor: Colors.purple[200],
          visualDensity: VisualDensity.adaptivePlatformDensity,

        ),
        home: SplashPage(),
    );
  }
}

