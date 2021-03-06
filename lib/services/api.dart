import 'package:flutter/material.dart';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;

import './storage.dart';
import '../routes.dart';

class Api {
  static final baseURL = "https://fatecanos-backend.herokuapp.com";

  // static final baseURL =  "http://192.168.43.219:8080";

  String getBaseURL() {
    return baseURL;
  }

  registerUser(String username, String password, context) async {
    var baseURL = this.getBaseURL();

    var user = json.encode({"username": username, "password": password});

    var headers = {
      "Content-type": "application/json",
      "Accept": "application/json"
    };

    try {
      var response =
          await http.post('${baseURL}/register', headers: headers, body: user);

      var status = response.statusCode;
      var decodedResponse = json.decode(response.body);
      var code = decodedResponse['code'];

      if (status != 200) throw new Error();

      new LocalStorage().setUserCredentials(username, password, code);

      var routes = Router.getRoutes();

      routes['home'];

      Navigator.push(context, MaterialPageRoute(builder: routes['home']));

      return {"status": status, "message": "Logado com sucesso!"};
    } catch (error) {
      print(error);

      return {
        "status": 401,
        "message":
            "Ocorreu uma falha na autenticação ou o siga deu problema, tente novamente!"
      };
    }
  }
}
