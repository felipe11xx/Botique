import 'package:botique/bloc/news_bloc.dart';
import 'package:botique/domain/news.dart';
import 'package:botique/domain/news_list.dart';
import 'package:botique/network/api_news.dart';
import 'package:botique/resources/strings.dart';
import 'package:botique/widgets/app_card_newsletters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        return _listView(newsList.news);
      },
    );
  }

  _listView(List<News> news) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
          itemCount: news != null ? news.length : 0,
          itemBuilder: (context, index) {
            News n = news[index];

            return cardNewsLetters(n, context);
          }),
    );
  }

  @override
  void dispose() {
    super.dispose();
    newsBloc.dispose();
  }
}
