
import 'package:botique/domain/comments/comment.dart';
import 'package:botique/widgets/app_card_messages.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class CommentsListView extends StatelessWidget {
  List<Comment> comments;

  CommentsListView(this.comments);

  @override
  Widget build(BuildContext context) {
    return _listView(comments);
  }

  _listView(List<Comment> comments) {


    return Container(
      child: ListView.builder(
        shrinkWrap: true,
          itemCount: comments != null ? comments.length : 0,
          itemBuilder: (context, index) {
            Comment comment = comments[index];
            return CardMessage(comment.author, comment.content, comment.postDate, context);
          }),
    );
  }
}
