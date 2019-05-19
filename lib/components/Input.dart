import 'package:flutter/material.dart';

TextField input(controller, isSecret) {
  return
    TextField(
      controller: controller,
      textAlign: TextAlign.left,
      obscureText: isSecret,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromRGBO(230, 230, 230, 1),
        contentPadding: const EdgeInsets.only(
          left: 14.0, 
          bottom: 13.0, 
          top: 13.0
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(16.0)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(16.0)
        )
      ),
      style: TextStyle(
        fontSize: 14,
        fontFamily: "JosefinSans",
        fontWeight: FontWeight.w400,
        color: Colors.black87,
      ),
    );
}