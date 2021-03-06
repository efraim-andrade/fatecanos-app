import 'dart:typed_data';
import 'dart:convert';

import 'package:flutter/material.dart';

Container userInfo(
  String name,
  String avatar,
  String course
) {
  Uint8List data = Base64Decoder().convert(avatar);

  return
    Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 6.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Container(
                height: 100,
                width: 100,
                child: Image.memory(base64.decode(avatar)),
              )
            ),
          ),

          Container(
            margin: const EdgeInsets.only(bottom: 6.0),
            child: Text(
              name,
              style: TextStyle(fontSize: 18),
            ),
          ),

          Text(
            course,
            style: TextStyle(
              fontSize: 12,
              color: Color.fromRGBO(108, 108, 108, 1)
            ),
          ),
        ],
      ),
    );
}
