import 'package:botique/domain/news.dart';
import 'package:botique/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

cardNewsLetters(News n, BuildContext context) {
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
            style: TextStyle(fontSize: 22),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                dateFormatter(n.message.createdAt) ?? "",
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

dateFormatter(String date){
  DateTime tempDate = new DateFormat("yyyy-MM-ddThh:mm:ssZ").parse(date);
  String dateFmt = DateFormat("yyyy/MM/dd hh:mm:ss").format(tempDate);
  return dateFmt;
}