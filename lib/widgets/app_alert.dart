import 'package:botique/resources/strings.dart';
import 'package:botique/utils/navigation.dart';
import 'package:flutter/material.dart';

alert(BuildContext context, String msg,
    {Function onClickOk, Function onClickCancel}) {
  return showDialog(
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
                onClickOk();

              },
            ),
            FlatButton(
              child: Text(Strings.cancel),
              onPressed: () {
                pop(context);
                onClickCancel();
              },
            )
          ],
        );
      });
}
