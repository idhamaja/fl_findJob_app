import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:practice_job_app_fl/models/request/auth/login_model.dart';
import 'package:practice_job_app_fl/models/response/auth/login_res_model.dart';
import 'package:practice_job_app_fl/services/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper {
  static var client = https.Client();

  static Future<bool> login(LoginModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.https(Config.apiUrl, Config.loginUrl);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model),
    );
    if (response.statusCode == 200) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      String token = loginResponseModelFromJson(response.body).userToken;
      String userId = loginResponseModelFromJson(response.body).userToken;
      String profile = loginResponseModelFromJson(response.body).userToken;

      await prefs.setString('token', token);
      await prefs.setString('userId', userId);
      await prefs.setString('profile', profile);
      await prefs.setBool('loggedIn', true);
      return true;
    } else {
      return false;
    }
  }
}
