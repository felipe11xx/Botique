
import 'package:botique/resources/strings.dart';
import 'package:botique/utils/navigation.dart';
import 'package:flutter/material.dart';

alert(BuildContext context, String msg) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(""),
          content: Text(msg),
          actions: <Widget>[
            FlatButton(
              child: Text(Strings.ok),
              onPressed: () {
                pop(context);
              },
            )
          ],
        );
      });
}
