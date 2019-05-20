import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

checkIcon(hasIcon) {
  if(!hasIcon) return Icon(
    FontAwesomeIcons.search,
    size: 0,
    color: Colors.deepOrangeAccent,
  );

  return Icon(
    FontAwesomeIcons.search,
    size: 14,
    color: Colors.deepOrangeAccent,
  );
}

TextField input(
  controller, 
  bool hasIcon,
  bool isSecret,
  String placeholder,
) {
  return
    TextField(
      controller: controller,
      textAlign: TextAlign.left,
      obscureText: isSecret,
      decoration: InputDecoration(
        filled: true,
        hintText: placeholder,
        suffix: checkIcon(hasIcon),
        fillColor: Color.fromRGBO(230, 230, 230, 1),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14.0, 
          vertical: 13.0, 
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