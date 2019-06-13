import 'package:flutter/material.dart';

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
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}