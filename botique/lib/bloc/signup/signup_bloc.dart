import 'package:botique/bloc/simple_bloc.dart';
import 'package:botique/firebase/firebase_service.dart';
import 'package:botique/network/api_response.dart';

class SignUpBloc extends BooleanBloc{

  Future<ApiResponse> signUp(String name,String email, String password)async{
    add(true);
    ApiResponse response = await FirebaseService().signUp(name,email, password);
    add(false);
    return response;
  }

}