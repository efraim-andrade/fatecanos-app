import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';

import '../components/Select.dart';

SimpleDialog createBigWallModal(
  courseController,
  wallDayController,
) {
  return SimpleDialog(
    contentPadding: EdgeInsets.all(20),
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Organizar Paredão",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600
            ),
          ),

          IconButton(
            color: Colors.black87,
            icon: Icon(CommunityMaterialIcons.close, size: 20,),
          )
        ],
      ),
    ),
    children: <Widget>[
      Container(
        child: select(),
      )
    ],
  );
}

