import 'package:flutter/material.dart';

import './screens/Login.dart';
import './screens/home.dart';

class Router {

  static getRoutes() {

    return <String, WidgetBuilder>{
      "login": (context) => LoginPage(),
      "home": (context) => HomePage()
    };

  }
}