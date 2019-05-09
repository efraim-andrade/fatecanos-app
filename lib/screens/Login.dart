import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../components/Button.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key); // prop-types

  final String title; // props

  @override
  Login createState() => Login();
}

class Login extends State<LoginPage> {
  TextEditingController passwordController = new TextEditingController();
  TextEditingController userController = new TextEditingController();

  var loading = false;

  Future _handleSubmit() async {
    //dynamic resp = await CloudFunctions.instance.getHttpsCallable('helloWorld');
    setState(() {
      loading = true;
    });

    print('user: ${userController.text}');
    print('password: ${passwordController.text}');

    print('Did Work Nice do Nice');
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
                                        TextField(
                                          controller: userController,
                                          textAlign: TextAlign.left,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Color.fromRGBO(230, 230, 230, 1),
                                            contentPadding: const EdgeInsets.only(
                                              left: 14.0, 
                                              bottom: 13.0, 
                                              top: 13.0
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white),
                                              borderRadius: BorderRadius.circular(16.0)
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white),
                                              borderRadius: BorderRadius.circular(16.0)
                                            )
                                          ),
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "JosefinSans",
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black87,
                                          ),
                                        )
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
                                        TextField(
                                          controller: passwordController,
                                          textAlign: TextAlign.left,
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Color.fromRGBO(230, 230, 230, 1),
                                            contentPadding: const EdgeInsets.only(
                                              left: 14.0, 
                                              bottom: 13.0, 
                                              top: 13.0
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white),
                                              borderRadius: BorderRadius.circular(16.0)
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white),
                                              borderRadius: BorderRadius.circular(16.0)
                                            )
                                          ),
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "JosefinSans",
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black87,
                                          ),
                                        )
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
