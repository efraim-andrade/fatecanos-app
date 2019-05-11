import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  final storage = new FlutterSecureStorage();

  getUserCredentials() async {
    var username = await storage.read(key: 'username');
    var password = await storage.read(key: 'password');

    var credentials = { 'username': username, 'password': password };
 
    return credentials; 
  }

  void setUserCredentials(String username, String password) async {
    await storage.write(key: 'username', value: username);
    await storage.write(key: 'password', value: password);
  }
}