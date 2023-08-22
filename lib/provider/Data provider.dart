import 'dart:core';
import 'package:flutter/material.dart';
import '../pojo/json.dart';

class DataProvider extends ChangeNotifier {
  LoginResponse? loginResponse;

  LoginResponse? get getLoginData => loginResponse;

  void setLoginData(LoginResponse? data) {
    loginResponse = data;
    notifyListeners();
  }
}
