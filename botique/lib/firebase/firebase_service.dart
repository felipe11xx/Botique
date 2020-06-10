import 'package:botique/domain/user.dart';
import 'package:botique/network/api_response.dart';
import 'package:botique/resources/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser fuser;

  Future<ApiResponse> loginGoogle() async {
    try {
      // Login com o Google
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      print("Google User: ${googleUser.email}");

      // Credenciais para o Firebase
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Login no Firebase
      AuthResult result = await _auth.signInWithCredential(credential);
      return _onLoginResult(result);
    } catch (error) {
      print("Firebase error $error");
      return ApiResponse.error(msg: "Não foi possível fazer o login");
    }
  }

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
      final user = result.user;
      final userUpdateInfo = UserUpdateInfo();
      userUpdateInfo.displayName = name;
      userUpdateInfo.photoUrl =
          "https://i.pinimg.com/474x/6a/f3/29/6af32952636b69c6b3a3fb115ae1eb43.jpg";
      user.updateProfile(userUpdateInfo);
      print("useer ${user.displayName}");
      _saveUser(user);

      return ApiResponse.ok(msg: Strings.userCreated);
    } catch (error) {
      print(error);

      return ApiResponse.error(
          msg: "${Strings.userNotCreated}\n\n${error.message}");
      // Cria um usuario do app
    }
  }

  ApiResponse _onLoginResult(AuthResult result) {
    final fuser = result.user;

    // Cria um usuario do app
    _saveUser(fuser);

    // Resposta genérica
    return ApiResponse.ok();
  }

  _saveUser(FirebaseUser fuser) {
    // Cria um usuario do app
    final user = User(
      name: fuser.displayName,
      login: fuser.email,
      email: fuser.email,
      id: fuser.uid,
      urlFoto: fuser.photoUrl,
    );
    user.save();
  }

  Future<void> logout() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
