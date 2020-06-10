import 'package:botique/domain/posts/post.dart';
import 'package:botique/domain/user.dart';
import 'package:botique/firebase/posts_service.dart';
import 'package:botique/pages/home/posts/post_listview.dart';
import 'package:botique/resources/strings.dart';
import 'package:botique/utils/date_formatter.dart';
import 'package:botique/utils/validator.dart';
import 'package:botique/widgets/app_inputtext.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
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
      stream: PostsService().stream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List<Post> posts =
            snapshot.data.documents.map((DocumentSnapshot document) {
          return Post.fromMap(document.data);
        }).toList();

        return PostsListView(posts);
      },
    );
  }

  _onSendComment() {
    if (!_formKey.currentState.validate()) return;

    Future<User> future = User.get();
    final String comment = _tComment.text;
    User user;
    Post p;
    future.then((value) => {
          user = value,
          p = Post(
              id: Uuid().v1(),
              authorId: user.id,
              author: user.name,
              postContent:comment ,
              postDate: dateNow()),
          PostsService().sendPost(p)
        });
    _tComment.text = "";
    FocusScope.of(context).requestFocus(new FocusNode());  }

  void _onEditComment() {
//    var now = DateTime.now();
//    var datePost = DateFormat("yyyy/MM/dd").format(now);
//    Firestore.instance.collection("posts").document("1").setData(Post(author: "Pedro",authorId: "2", postContent: "postagem nova", postDate:datePost).toJson());
  }

  void _onDeletePost() {}
}
