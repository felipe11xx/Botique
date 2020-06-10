import 'package:botique/domain/comments/comment.dart';
import 'package:botique/domain/user.dart';
import 'package:botique/firebase/comments_service.dart';
import 'package:botique/pages/home/comments/comments_listview.dart';
import 'package:botique/resources/strings.dart';
import 'package:botique/utils/date_formatter.dart';
import 'package:botique/utils/validator.dart';
import 'package:botique/widgets/app_inputtext.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CommentsPage extends StatefulWidget {
  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  final _tComment = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  _body() {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Expanded(
            child: _streamBuilder(),
          ),
          SizedBox(
            height: 20,
          ),
          Form(
            key: _formKey,
            child: AppInputText(
              Strings.comment,
              Strings.createComment,
              validator: validateField,
              textEditingController: _tComment,
              maxLength: 280,
              suffixIcon: IconButton(
                icon: Icon(Icons.send),
                onPressed: _onSendComment,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _streamBuilder() {
    return StreamBuilder<QuerySnapshot>(
      stream: CommentsService().stream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List<Comment> comments =
            snapshot.data.documents.map((DocumentSnapshot document) {
          return Comment.fromMap(document.data);
        }).toList();

        return CommentsListView(comments);
      },
    );
  }

  _onSendComment() {
    if (!_formKey.currentState.validate()) return;

    Future<User> future = User.get();
    final String comment = _tComment.text;
    User user;
    Comment c;
    future.then((value) => {
          user = value,
          c = Comment(
              id: Uuid().v1(),
              authorId: user.id,
              author: user.name ,
              content:comment ,
              postDate: dateNow()),

          CommentsService().sendPost(c)
        });
    _tComment.text = "";
    FocusScope.of(context).requestFocus(new FocusNode());  }

  void _onEditComment() {
}

  void _onDeletePost() {}
}
