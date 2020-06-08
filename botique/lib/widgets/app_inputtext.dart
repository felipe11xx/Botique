import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class AppInputText extends StatelessWidget {

  String label;
  String hint;
  bool isPassword;
  TextEditingController textEditingController;
  FormFieldValidator<String> validator;
  TextInputType keyboardType;
  TextInputAction action;
  TextCapitalization textCapitalization;
  FocusNode focusNode;
  FocusNode nextFocus;

  AppInputText(this.label,
      this.hint,
      {this.isPassword = false,
      this.textEditingController,
      this.validator,
      this.keyboardType,
      this.action,
      this.focusNode,
      this.nextFocus,
      this.textCapitalization = TextCapitalization.none});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      style: TextStyle( fontSize: 25),
      obscureText: isPassword,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: action,
      textCapitalization: textCapitalization,
      focusNode: focusNode,
      onFieldSubmitted: (text) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        }
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey, fontSize: 25),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
      ),
    );
  }
}