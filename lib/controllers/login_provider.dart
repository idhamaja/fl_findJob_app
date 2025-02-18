import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_job_app_fl/models/request/auth/login_model.dart';
import 'package:practice_job_app_fl/services/helpers/auth_helper.dart';
import 'package:practice_job_app_fl/views/common/exports.dart';
import 'package:practice_job_app_fl/views/ui/auth/update_user.dart';
import 'package:practice_job_app_fl/views/ui/mainscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginNotifier extends ChangeNotifier {
  bool _obscureText = true;
  bool get obscureText => _obscureText;

  set obscureText(bool newState) {
    _obscureText = newState;
    notifyListeners();
  }

  //entryPoint
  bool? _entrypoint;
  bool get entrypoint => _entrypoint ?? false;

  set entrypoint(bool newState) {
    _entrypoint = newState;
    notifyListeners();
  }

  //firstTime
  bool _firstTime = true;
  bool get firstTime => _firstTime;

  set firstTime(bool newState) {
    _firstTime = newState;
    notifyListeners();
  }

  //loggedIn
  bool? _loggedIn;
  bool get loggedIn => _loggedIn ?? false;

  set loggedIn(bool newState) {
    _loggedIn = newState;
    notifyListeners();
  }

  final loginFormKey = GlobalKey<FormState>();

  bool validateAndSave() {
    final form = loginFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  getPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    entrypoint = prefs.getBool('entrypoint') ?? false;
  }

  //login Provider
  userLogin(LoginModel model) {
    AuthHelper.login(model).then((response) {
      if (response && firstTime) {
        Get.off(() => const PersonalDetails());
      } else if (response && !firstTime) {
        Get.off(() => const MainScreen());
      } else if (!response) {
        Get.snackbar(
          "Sign Failed",
          "Please Check your credentials",
          colorText: kLight,
          backgroundColor: Colors.red,
          icon: const Icon(Icons.add_alert),
        );
      }
    });
  }

  //Logout
  logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('loggedIn', false);
    await prefs.remove('token');
    _firstTime = false;
  }
}
