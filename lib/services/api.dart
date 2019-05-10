import 'dart:convert' show json;
import 'package:http/http.dart' as http;

class Api {
  static final baseURL =  "https://fatecanos-backend.herokuapp.com";

  // static final baseURL =  "http://192.168.43.219:8080";

  String getBaseURL() {
    return baseURL;
  }

  registerUser(String username, String password) async {
    var baseURL = this.getBaseURL();

    var user = json.encode({
        "username": username,
        "password": password
    });

    var headers = {
      "Content-type": "application/json", 
      "Accept": "application/json"
    };

    try {
      var response = await http.post('${baseURL}/register',
        headers: headers, 
        body: user
      );

      var status = response.statusCode;

      if(status != 200) throw new Error();

      return "deu muito bom, ${status}";
    } catch(error) {
      return "Ocorreu uma falha na autenticação ou o siga deu problema, tente novamente!";
    }
  }
}