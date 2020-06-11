import 'package:botique/domain/comments/comment.dart';
import 'package:botique/domain/user.dart';
import 'package:botique/resources/strings.dart';
import 'package:botique/widgets/app_siladable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'comments_page.dart';

// ignore: must_be_immutable
class CommentsListView extends StatefulWidget {
  List<Comment> comments;
  OnClickItem onClickItem;
  CommentsListView(this.comments, this.onClickItem);

  @override
  _CommentsListViewState createState() => _CommentsListViewState();
}

class _CommentsListViewState extends State<CommentsListView> {
  User user = User();

  @override
  Widget build(BuildContext context) {
    return _listView(widget.comments);
  }

  @override
  void initState() {
    super.initState();
    _initUser();
  }

  _initUser() {
    Future<User> future = User.get();
    future.then((value) => {user = value, print("name ===== ${value.name}")});
  }

  _listView(List<Comment> comments) {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: comments != null ? comments.length : 0,
          itemBuilder: (context, index) {
            Comment comment = comments[index];
            return CommentSlid(
              comment,
              _slideLeft(comment),
              actionRight: _slideRight(comment),
              enableActions: _enableActions(comment),
            );
          }),
    );
  }

  _slideRight(comment) {
    return IconSlideAction(
      caption: Strings.edit,
      color: Colors.deepPurple,
      icon: Icons.edit,
      onTap: () => widget.onClickItem.onClickEdit(comment),
    );

  }

  _slideLeft(comment) {
    return IconSlideAction(
      caption: Strings.delete,
      color: Colors.red,
      icon: Icons.delete,
      onTap: () => widget.onClickItem.onClickDelete(comment.id),
    );
  }

  _enableActions(Comment comment) {
    return (user.id == comment.authorId);
  }
}
