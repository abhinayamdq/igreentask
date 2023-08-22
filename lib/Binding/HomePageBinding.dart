import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/HomePageController.dart';
import '../Controller/Login_page_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController());
  }
}
