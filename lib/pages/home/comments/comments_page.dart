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

class _CommentsPageState extends State<CommentsPage>
    with OnClickItem, AutomaticKeepAliveClientMixin {
  final _tComment = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _textFocus = FocusNode();
  Comment comment;
  User user;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
          inputComment()
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

        return CommentsListView(comments, this);
      },
    );
  }

  inputComment() {
    return Form(
      key: _formKey,
      child: AppInputText(
        Strings.comment,
        Strings.createComment,
        validator: validateField,
        textEditingController: _tComment,
        focusNode: _textFocus,
        maxLength: 280,
        suffixIcon: IconButton(
          icon: Icon(Icons.send),
          onPressed: onClickSend,
        ),
      ),
    );
  }

  onClickSend() {
    if (!_formKey.currentState.validate()) return;
    if (comment == null) {
      _onSendComment();
    } else {
      _onEditComment();
    }
  }

  _onSendComment() {
    Future<User> future = User.get();
    final String commentContent = _tComment.text;

    comment = Comment(
        id: Uuid().v1(),
        authorId: user.id,
        author: user.name,
        content: commentContent,
        postDate: dateNow());
    CommentsService().sendPost(comment);

    _clearComment();
  }

  _onEditComment() {
    comment.content = _tComment.text;
    comment.postDate = dateNow();
    CommentsService().editPost(comment);
    _clearComment();
  }

  _clearComment() {
    _tComment.text = "";
    FocusScope.of(context).requestFocus(new FocusNode());
    comment = null;
  }

  @override
  // ignore: missing_return
  onClickEdit(Comment comment) {
    this.comment = comment;
    _tComment.text = this.comment.content;
    FocusScope.of(context).requestFocus(_textFocus);
  }

  @override
  onClickDelete(String commentId) {
    CommentsService().deletePost(commentId);
  }
}

abstract class OnClickItem {
  void onClickEdit(Comment comment);

  void onClickDelete(String commentId);
}
