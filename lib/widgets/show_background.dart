import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget ShowBackground(int direction) {
  return Container(
    margin: const EdgeInsets.all(4.0),
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    color: Colors.red,
    alignment: direction == 0 ? Alignment.centerLeft : Alignment.centerRight,
    child: Icon(
      Icons.delete,
      size: 30.0,
      color: Colors.white,
    ),
  );
}
