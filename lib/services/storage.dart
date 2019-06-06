import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  final storage = new FlutterSecureStorage();

  getUserCredentials() async {
    var username = await storage.read(key: 'username');
    var password = await storage.read(key: 'password');

    var credentials = { 'username': username, 'password': password };

    return credentials;
  }

  getUserInfo() async {
    var name = await storage.read(key: 'name');
    var period = await storage.read(key: 'period');
    var course = await storage.read(key: 'course');
    var picture = await storage.read(key: 'picture');

    var userInformation = {
      'name': name,
      'period': period,
      'course': course,
      'picture': picture,
    };

    return userInformation;
  }

  void setUserCredentials(String username, String password) async {
    await storage.write(key: 'username', value: username);
    await storage.write(key: 'password', value: password);
  }

  void setUserInfo(userInformation) async {
    if(userInformation != null) {
      await storage.write(key: 'name', value: userInformation["name"]);
      await storage.write(key: 'period', value: userInformation["period"]);
      await storage.write(key: 'course', value: userInformation["course"]);
      await storage.write(key: 'avatar', value: userInformation["avatar"]);
    }
  }
}
