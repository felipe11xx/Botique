import 'package:botique/bloc/news_bloc.dart';
import 'package:botique/domain/news_list.dart';
import 'package:botique/resources/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'newsletters_listview.dart';

class NewsLettersPage extends StatefulWidget {
  @override
  _NewsLettersPageState createState() => _NewsLettersPageState();
}

class _NewsLettersPageState extends State<NewsLettersPage> with AutomaticKeepAliveClientMixin<NewsLettersPage> {

  NewsList newsList;

  NewsBloc newsBloc = NewsBloc();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {

    super.initState();
    newsBloc.fetch();
  }

  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
      stream: newsBloc.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("erro >>>> ${snapshot.error.toString()}");
          return Center(
            child: Text(
              Strings.newsError,
              style: TextStyle(color: Colors.red,
                  fontSize: 22),
            ),
          );
        }

        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        NewsList newsList = snapshot.data;
        return NewsletterListView(newsList.news);
      },
    );
  }


  @override
  void dispose() {
    super.dispose();
    newsBloc.dispose();
  }
}
