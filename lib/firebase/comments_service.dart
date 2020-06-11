import 'package:botique/domain/comments/comment.dart';
import 'package:botique/resources/strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CommentsService {
  get _comments => Firestore.instance
      .collection(Strings.commentsCollection)
      .orderBy("postDate", descending: true);

  get stream => _comments.snapshots();

  Future<bool> sendPost(Comment c) async {
    Firestore.instance
        .collection(Strings.commentsCollection)
        .document(c.id)
        .setData(c.toJson());
    return true;
  }

  Future<bool> editPost(Comment c) async {
    Firestore.instance
        .collection(Strings.commentsCollection)
        .document(c.id)
        .setData(c.toJson());
    return true;
  }

  Future<bool> deletePost(String commentId) async {
    Firestore.instance
        .collection(Strings.commentsCollection)
        .document(commentId)
        .delete();

    return true;
  }
}
