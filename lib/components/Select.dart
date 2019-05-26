import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const FIRST_VALUE = 0;

const courses = [
  {"name": "Programação Web"},
  {"name": "Laboratório de Engenharia de Software IV"},
];

DropdownButton select(
  // selectValues,
) {
  return
    DropdownButton(
      // value: selectValues[FIRST_VALUE],

      items: courses
        .map((value) => DropdownMenuItem(
          child: Text(value["name"]),
          value: value
        )).toList(),
    );
}
