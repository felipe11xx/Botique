import 'package:botique/domain/comments/comment.dart';
import 'package:botique/resources/strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CommentsService {

  get _comments => Firestore.instance.collection(Strings.commentsCollection).orderBy("content");

  get stream => _comments.snapshots();

  Future<bool> sendPost(Comment c) async{
    Firestore.instance.collection(Strings.commentsCollection).document(c.id).setData(c.toJson());
    return true;
  }

  Future<bool> editPost(Comment c) async {
    DocumentReference docRef = _comments.document("${c.id}");
    docRef.setData(c.toJson());
    return true;
  }

  Future<bool> deletePost(Comment p) async {
    DocumentReference docRef = _comments.document("${p.id}");
    docRef.delete();
    return true;
  }
}