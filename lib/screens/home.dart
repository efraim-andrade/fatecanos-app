import 'package:flutter/material.dart';

import '../components/Card.dart';
import '../components/Input.dart';

class HomePage extends StatefulWidget {

  HomePage({Key key}) : super(key: key); // prop-types

  @override
  Home createState() => Home();
}

class Home extends State<HomePage> {
  TextEditingController searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            input(searchController, false, "Buscar matéria"),
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