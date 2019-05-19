import 'package:flutter/material.dart';
import '../components/Card.dart';

class HomePage extends StatefulWidget {

  HomePage({Key key}) : super(key: key); // prop-types

  @override
  Home createState() => Home();
}

class Home extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            card(
              "Engenharia de Software IV",
              "Danilo Ruy Gomes",
              28,
              12,
              20,
              4.5
            ),
            card(
              "Programação Web",
              "José Antônio Castanho de Almeida",
              22,
              18,
              20,
              2
            ),
          ],
        ),
      ),
    );
  }
}