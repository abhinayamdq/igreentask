import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

void showLoadingProgress() async {
  String someValue = await Get.showOverlay(
      loadingWidget: Container(
        child: const Center(child: CircularProgressIndicator()),
      ),
      asyncFunction: () =>
      Future<String>.delayed(Duration(seconds: 5), () => "Error"));
  print(someValue);
}

Widget loadingWidget() => const Center(child: CircularProgressIndicator());