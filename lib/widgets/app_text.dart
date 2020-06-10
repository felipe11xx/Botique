import 'package:flutter/material.dart';

Text text(String s,
    {double fontSize = 16,
    color = Colors.black,
    bold = false,
    decoration = TextDecoration.none,
    textAlign = TextAlign.left}) {
  return Text(
    s ?? "",
    textAlign: textAlign,
    style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        decoration: decoration),
  );
}
