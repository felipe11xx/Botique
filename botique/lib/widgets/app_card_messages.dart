import 'package:botique/domain/posts/post.dart';
import 'package:botique/resources/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardMessage extends StatelessWidget {

 String author;
 String content;
 String date;

 CardMessage(this.author, this.content, this.date, BuildContext context);

  @override
  Widget build(BuildContext context) {
    return _card(author,content, date, context);
  }

  _card(String author, String content, String date, BuildContext context) {
    return Card(
      color: Colors.grey[200],
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              author ?? Strings.botique,
              style: TextStyle(fontSize: 16),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              content ?? "",
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                 date?? "",
                  style: TextStyle(fontSize: 10),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
