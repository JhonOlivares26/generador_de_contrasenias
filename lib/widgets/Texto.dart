import 'package:flutter/material.dart';

Widget Textoo(String text) {
  return Row(
    children: [
      Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}