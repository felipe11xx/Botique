import 'package:botique/domain/posts/post.dart';
import 'package:botique/widgets/app_card_messages.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class PostsListView extends StatelessWidget {
  List<Post> posts;

  PostsListView(this.posts);

  @override
  Widget build(BuildContext context) {
    return _listView(posts);
  }

  _listView(List<Post> posts) {


    return Container(
      child: ListView.builder(
        shrinkWrap: true,
          itemCount: posts != null ? posts.length : 0,
          itemBuilder: (context, index) {
            Post post = posts[index];
            return CardMessage(post.author, post.postContent, post.postDate, context);
          }),
    );
  }
}
