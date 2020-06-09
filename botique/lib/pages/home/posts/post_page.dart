import 'package:botique/domain/posts/post.dart';
import 'package:botique/pages/home/posts/post_listview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('posts').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List<Post> posts = snapshot.data.documents.map((DocumentSnapshot document) {
          return Post.fromMap(document.data);
        }).toList();

        return PostsListView(posts);
      },
    );
  }
}
