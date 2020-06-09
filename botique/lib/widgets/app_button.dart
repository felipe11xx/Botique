import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {

  String text;
  Function onPressed;
  bool showProgress;
  Color color;
  Color textColor;

  AppButton(this.text, {this.onPressed, this.showProgress = false, this.color = Colors.deepPurpleAccent, this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: RaisedButton(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: showProgress
            ? Container(
                height:30,
                width: 30,
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              )
            : Text(
                text,
                style: TextStyle(color: textColor, fontSize: 22),
              ),
        onPressed: onPressed,
      ),
    );
  }
}
