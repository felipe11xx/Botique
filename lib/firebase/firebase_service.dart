import 'package:botique/domain/user.dart';
import 'package:botique/network/api_response.dart';
import 'package:botique/resources/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser fuser;

  Future<ApiResponse> loginWithEmail(String email, String password) async {
    try {
      // Login no Firebase
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return _onLoginResult(result);
    } catch (error) {
      print("Firebase error $error");
      return ApiResponse.error(msg: "Não foi possível fazer o login\n\n${error.message}");
    }
  }

  Future<ApiResponse> signUp(String name, String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return  _updateUser(name, result);
    } catch (error) {
      print(error);

      return ApiResponse.error(
          msg: "${Strings.userNotCreated}\n\n${error.message}");
    }
  }

  Future<ApiResponse> _updateUser(String name, AuthResult result )async{
    final user = result.user;
    final userUpdateInfo = UserUpdateInfo();
    userUpdateInfo.displayName = name;
    userUpdateInfo.photoUrl = Strings.defaultPicture;

   await user.updateProfile(userUpdateInfo).whenComplete(() async => {
      await FirebaseAuth.instance.currentUser().then((value) => {
        saveUser(value),
      })
    });

   return ApiResponse.ok(msg: Strings.userCreated);
  }

  ApiResponse _onLoginResult(AuthResult result) {
    final fuser = result.user;

    // Cria um usuario do app
    saveUser(fuser);
    // Resposta genérica
    return ApiResponse.ok();
  }

  saveUser(FirebaseUser fuser) {
    // Cria um usuario do app
    final user = User(
      name: fuser.displayName,
      email: fuser.email,
      id: fuser.uid,
      urlFoto: fuser.photoUrl,
    );
    user.save();
  }

  Future<void> logout() async {
    await _auth.signOut();
   // await _googleSignIn.signOut();
  }
}
