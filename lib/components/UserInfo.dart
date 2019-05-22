import 'package:flutter/material.dart';

Container userInfo() {
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
                child: Image.network("https://avatars1.githubusercontent.com/u/28229600?s=460&v=4"),
              )
            ),
          ),

          Container(
            margin: const EdgeInsets.only(bottom: 6.0),
            child: Text(
              "Efraim Andrade",
              style: TextStyle(fontSize: 18),
            ),
          ),

          Text(
            "Análise e Desenvolvimento de Sistemas",
            style: TextStyle(
              fontSize: 12,
              color: Color.fromRGBO(108, 108, 108, 1)
            ),
          ),
        ],
      ),
    );
}