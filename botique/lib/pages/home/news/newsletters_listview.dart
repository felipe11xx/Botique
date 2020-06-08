import 'package:botique/domain/news.dart';
import 'package:botique/widgets/app_card_newsletters.dart';
import 'package:flutter/cupertino.dart';

class NewsletterListView extends StatelessWidget {
  List<News> news;

  NewsletterListView(this.news);

  @override
  Widget build(BuildContext context) {
    return _listView(news);
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
}
