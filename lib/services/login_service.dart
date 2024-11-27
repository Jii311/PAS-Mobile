import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pas1_mobile_11pplg2_11/models/login_model.dart';

class LoginService {
  Future<LoginModel> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('https://mediadwi.com/api/latihan/login'),
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: {
        "username": username,
        "password": password,
      },
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return LoginModel.fromJson(data);
    } else {
      throw Exception("Failed to login");
    }
  }
}
