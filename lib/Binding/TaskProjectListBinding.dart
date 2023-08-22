import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Controller/TaskProjectListController.dart';
class TaskProjectListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskProjectListController>(() => TaskProjectListController());
  }
}
