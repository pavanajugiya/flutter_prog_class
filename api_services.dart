import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import "package:/lib/APIs/login/login_model.dart";
import 'package:shared_preferences/shared_preferences.dart';

import '../login/login_model.dart';
import '../login/login_model.dart' as login;
class ApiServices {

  // async: parallel tasking
  Future<void> login(String email, String password) async   {

    // from session
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final res = await http.post(Uri.parse("https://www.anniecabs.com/LJ/index.php/api/login"),
        body: {
          "Email": email,
          "Password": password,
        }
      );

      // 201: if we get data successfully in system
      if (res.statusCode == 200 || res.statusCode == 201) {
        final jsonData = jsonDecode(res.body);
        final userValue = login.LoginResponse(jsonData);
        return userValue;
      }
      else {
        throw Exception("Error!!!");
      }
    }catch(e) {
        print(e);
        throw Exception("Error!!!");
    }
  }
}