import 'package:flutter/material.dart';

  
RaisedButton button(String title, String color, _handleSubmit) {
  return
  RaisedButton(
    onPressed: () { _handleSubmit(); },

    textColor: Colors.white,
    color: color == "primary" ? Colors.deepOrange : Colors.cyan,
    splashColor: Colors.orangeAccent,
    padding: EdgeInsets.all(16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8)
    ),

    child: Text(
      title,

      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700
      ),
    ),
  );
}