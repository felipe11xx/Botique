import 'package:botique/resources/strings.dart';
import 'package:email_validator/email_validator.dart';

String validateField(String value) {
  if (value.isEmpty) {
    return Strings.insertAText;
  }
  return null;
}

String validateName(String value) {
  if(!value.trim().contains(" ") ){
    return Strings.invalidName;
  }
  return null;
}

String validatePassword(String value) {
  if(value.length < 6){
    return Strings.invalidPassword;
  }
  return null;
}

String validateEmail(String value) {
  if(!EmailValidator.validate(value)){
    return Strings.invalidEmail;
  }
  return null;
}