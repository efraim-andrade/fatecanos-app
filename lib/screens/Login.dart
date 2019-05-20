import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../services/api.dart';
import '../services/storage.dart';

import '../components/Toast.dart';
import '../components/Button.dart';
import '../components/Input.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.loged}) : super(key: key); // prop-types

  final ValueChanged<bool> loged;

  @override
  Login createState() => Login();
}

class Login extends State<LoginPage> {
  TextEditingController passwordController = new TextEditingController();
  TextEditingController userController = new TextEditingController();

  var loading = false;

  void initState() {
    super.initState();
  }

  Future _handleSubmit() async {
    setState(() {
      loading = true;
    });

    var username = userController.text;
    var password = passwordController.text;

    var response = await new Api().registerUser(username, password, context);

    var credentials = await new LocalStorage().getUserCredentials();

    print(credentials);

    setState(() {
      loading = false;
    });

    new TheToast(response, context).setToast();
  }

  @override
  Widget build(BuildContext context) { // render()
    userController.text = DotEnv().env['SIGA_USER'];
    passwordController.text = DotEnv().env['SIGA_PASSWORD'];

    return
     Scaffold(
      resizeToAvoidBottomInset: true,
      body: 
      SingleChildScrollView(
        child: Stack(
          children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 160.0),
                decoration: BoxDecoration(color: Colors.white),
                
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start, //Horizontal
                  crossAxisAlignment: CrossAxisAlignment.center,//Vertical

                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(bottom: 60.0),
                      child: 
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start, //Horizontal
                          crossAxisAlignment: CrossAxisAlignment.start, //Vertical
                          children: [

                            Container(  
                              child: 
                                Text(
                                  'Seja bem vindo ao,',

                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: "JosefinSans",
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black87
                                  ),
                                ),
                            ),

                            Container(
                              margin: const EdgeInsets.only(bottom: 8.0),
                              child:
                                Text(
                                  'Fatecanos',

                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 56,
                                    fontFamily: "JosefinSans",
                                    fontWeight: FontWeight.w400,
                                    color: Colors.deepOrangeAccent
                                  ),
                                )
                            ),

                            Container(
                              margin: const EdgeInsets.only(bottom: 8.0),
                              child:
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'insira seu usuário e senha do ',

                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: "JosefinSans",
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black87
                                      ),
                                    ),

                                    Text(
                                      'SIGA',

                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: "JosefinSans",
                                        fontWeight: FontWeight.w700,
                                        color: Colors.deepOrangeAccent
                                      ),
                                    ),

                                    Text(
                                      ' para continuar.',

                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: "JosefinSans",
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black87
                                      ),
                                    ),
                                  ],
                                )
                            )
                          ]
                        ),
                    ),

                    Form(
                      child: 
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start, //Horizontal
                          crossAxisAlignment: CrossAxisAlignment.start, //Vertical
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 8.0),
                              child: 
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.only(left: 10.0, bottom: 4.0),

                                      child: 
                                        Text(
                                          'Usuário:',

                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "JosefinSans",
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black87
                                          ),
                                        ),
                                    ),

                                    Container(
                                      margin: const EdgeInsets.only(bottom: 8.0),
                                      child:
                                        input(userController, false, false, "")
                                    ),
                                  ],
                                )
                            ),

                            Container(
                              margin: const EdgeInsets.only(bottom: 30.0),
                              child: 
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.only(left: 10.0, bottom: 4.0),

                                      child: 
                                        Text(
                                          'Senha:',

                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "JosefinSans",
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black87
                                          ),
                                        ),
                                    ),

                                    Container(
                                      margin: const EdgeInsets.only(bottom: 8.0),
                                      child:
                                        input(passwordController, false, true, "")
                                    ),
                                  ],
                                )
                            ),

                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(bottom: 8.0),
                              child: button("ENTRAR", "primary", _handleSubmit) ,
                            )
                          ]
                        ),
                    ),
                  ],
                ),
              ),
              Opacity(
                opacity: 0.8,
                child: 
                  Visibility(
                    visible: loading,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: new BoxDecoration(
                        color: Colors.white
                      ),
                      child: Center(
                        child: new CircularProgressIndicator(),
                    ),
                  ),
                ),
              )
            ]
          )   
        )
      );
    }
}
