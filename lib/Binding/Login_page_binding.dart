import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/Login_page_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<login_pageController>(() => login_pageController());
  }
}
