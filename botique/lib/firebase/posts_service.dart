import 'package:botique/domain/posts/post.dart';
import 'package:botique/resources/strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostsService {

  get _posts => Firestore.instance.collection(Strings.postCollection);

  get stream => _posts.snapshots();

  Future<bool> sendPost(Post p) async{
    Firestore.instance.collection(Strings.postCollection).document(p.id).setData(p.toJson());
    print("id ====== ${p.id}");
    return true;
  }

  Future<bool> editPost(Post p) async {
    DocumentReference docRef = _posts.document("${p.id}");
    docRef.setData(p.toJson());
    return true;
  }

  Future<bool> deletePost(Post p) async {
    DocumentReference docRef = _posts.document("${p.id}");
    docRef.delete();
    return true;
  }
}