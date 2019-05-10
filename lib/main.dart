import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import './screens/Login.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fatecanos',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'JosefinSans'
      ),
      home: LoginPage(title: 'Fatecanos'),
    );
  }
}
