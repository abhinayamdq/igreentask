import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TaskAssignedController extends GetxController {
  TextEditingController projectdatecontroller = TextEditingController();
  TextEditingController completiondatecontroler = TextEditingController();
  TextEditingController deadlinecontroler = TextEditingController();
  TextEditingController Typecontroller = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
  }
}
