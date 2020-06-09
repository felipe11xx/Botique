import 'package:botique/pages/home/news/newsletters_page.dart';
import 'package:botique/pages/home/profile_drawer_list.dart';
import 'package:botique/resources/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(Strings.botique),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: Strings.posts,
              ),
              Tab(
                text: Strings.newsletters,
              ),
            ],
          ),
        ),
        drawer: ProfileDrawerList(
            name: "Felipe",
            email: "felipe@hotmail.com",
            profilePicture:
                "https://i.pinimg.com/474x/6a/f3/29/jotaro.jpg"),
        body: TabBarView(
          children: <Widget>[
            Container(
              color: Colors.red,
            ),
            NewsLettersPage()
          ],
        ),
      ),
    );
  }
}
