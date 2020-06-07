import 'package:botique/domain/news.dart';
import 'package:botique/resources/strings.dart';
import 'package:flutter/material.dart';

card(News n, BuildContext context) {
  return Card(
    color: Colors.grey[200],
    child: Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Text(
            n.user.name ?? Strings.botique,
            style: TextStyle(fontSize: 16),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            n.message.content ?? "",
            style: TextStyle(fontSize: 32),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            n.message.createdAt ?? "",
            style: TextStyle(fontSize: 10),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}