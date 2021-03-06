import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import './routes.dart';

import './services/storage.dart';
import './screens/Login.dart';
import './screens/home.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(Boostrap());
}

class Boostrap extends StatefulWidget {
  @override
  MyApp createState() => MyApp();
}

class MyApp extends State<Boostrap> {
  bool loged = false;

  void changeLogin(bool val){ 
    setState(() {
      loged = val;
    });
  }

   isLogged() async {
    var credentials = await new LocalStorage().getUserCredentials();

    if(credentials['username'] == null || credentials['password'] == null) return  false;

    return true;
  }

  initState() {
    super.initState();

    this.isLogged().then((result) {
      setState(() {
        loged = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fatecanos',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'JosefinSans'
      ),
      routes: Router.getRoutes(),
      home: !loged ? LoginPage(loged: changeLogin) : HomePage(),
    );
    
  }
}
