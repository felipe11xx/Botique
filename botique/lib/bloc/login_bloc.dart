import 'package:botique/bloc/simple_bloc.dart';
import 'package:botique/firebase/firebase_service.dart';
import 'package:botique/network/api_response.dart';

class LoginBloc extends BooleanBloc {
  Future<ApiResponse> login(String email, String password)async{
    add(true);
    ApiResponse response = await FirebaseService().loginWithEmail(email, password);
    add(false);
    return response;
  }
}