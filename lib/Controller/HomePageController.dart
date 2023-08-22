import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Api/Api connet.dart';
class HomePageController extends GetxController {
  final ApiConnect _connect = Get.put(ApiConnect());

  @override
  void onInit() async {
    super.onInit();
  }

}