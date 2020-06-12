import 'package:botique/resources/strings.dart';
import 'package:botique/utils/validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('empty email returns error string', () {

    final result = validateEmail('');
    expect(result, Strings.invalidEmail);
  });

  test('invalid format Email returns error String', () {
    final result = validateEmail('Email.elail');
    expect(result, Strings.invalidEmail);
  });

  test('valid format Email returns error null', () {
    final result = validateEmail('felipe@email.com');
    expect(result, null);
  });

  test('empty password returns error string', () {
    final result = validatePassword('');
    expect(result, Strings.invalidPassword);
  });

  test('invalid password length returns error String', () {
    final result = validatePassword('12345');
    expect(result, Strings.invalidPassword);
  });

  test('valid password length returns error null', () {
    final result = validatePassword('12345');
    expect(result, null);
  });

  test('empty text input returns error ', (){
    final result = validateField('');
    expect(result, Strings.insertAText);
  });

  test('empty name input returns error ', (){
    final result = validateField('22 s');
    expect(result, Strings.invalidName);
  });

  test('invalid name format returns error ', (){
    final result = validateField('Moises');
    expect(result, Strings.invalidName);
  });

  test('valid name format returns null ', (){
    final result = validateField('Moises');
    expect(result, null);
  });

}