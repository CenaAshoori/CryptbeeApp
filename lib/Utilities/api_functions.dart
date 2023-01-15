import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

const String noInternet = "App_Error:No_Internet";

Future<void> saveData(Map response) async {
  log("saving response of $response ");
  final prefs = await SharedPreferences.getInstance();
  if (response['access'] != null) {
    prefs.setString('access', response['access']);
    log("saving access of ${response['access']} ");
  }
  if (response['refresh'] != null) {
    prefs.setString('refresh', response['refresh']);
    log("saving refresh of ${response['refresh']} ");
  }
  if (response['two_factor'] != null) {
    prefs.setBool('2fa', response['two_factor']);
    log("saving two_factor of ${response['two_factor']} ");
  }
  if (response['pan_verify'] != null) {
    prefs.setBool('pan_verify', response['pan_verify']);
    log("saving pan_verify of ${response['pan_verify']} ");
  }
  if (response['is_verified'] != null) {
    prefs.setBool('is_verified', response['is_verified']);
    log("saving is_verified of ${response['is_verified']} ");
  }
}

Future<void> clearData() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.clear();
}

void internetHandler(BuildContext context) {
  ToastContext().init(context);
  Toast.show("No Internet Connection Found!!",
      duration: 5, gravity: Toast.bottom);
}