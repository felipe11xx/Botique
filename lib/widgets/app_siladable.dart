
import 'dart:ffi';

import 'package:botique/domain/comments/comment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'app_card_messages.dart';

class CommentSlid extends StatelessWidget {
  Comment comment;
  IconSlideAction actionLeft;
  IconSlideAction actionRight;
  double actionExtentRatio;
  bool enableActions;


  CommentSlid(this.comment,  this.actionLeft, {this.actionRight,
    this.actionExtentRatio = 0.50, this.enableActions = true});

  @override
  Widget build(BuildContext context) {
    return slide(context);
  }

  slide(context) {
    return  Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: actionExtentRatio,
      enabled: enableActions,
      child: CardMessage(
          comment.author, comment.content, comment.postDate, context),
      actions: <Widget>[
        actionLeft
      ],
      secondaryActions: <Widget>[
        actionRight,
      ],
    );
  }

}


