import 'package:botique/domain/news/news.dart';
import 'package:botique/utils/date_formatter.dart';
import 'package:botique/widgets/app_card_messages.dart';
import 'package:flutter/cupertino.dart';


// ignore: must_be_immutable
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

            return CardMessage(n.user.name, n.message.content,
                dateFormatter(n.message.createdAt), context);
          }),
    );
  }
}
