import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:provider/provider.dart';
import '../Api/Api connet.dart';
import '../AppSnackBar.dart';
import '../pojo/TaskList.dart';


class TaskProjectListController extends GetxController {
  final ApiConnect _connect = Get.put(ApiConnect());
  RxBool initialLoading = RxBool(true);
  RxBool isGet = RxBool(false);
  RxString startDate = RxString("");
  RxString endDate = RxString("");
  RxString description = RxString("");
  RxString taskName = RxString("");
  List<Data>? data;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getTaskList() async {
    var response = await _connect.taskListConnect();
    print('loose');
    if (!response.error!) {
      this.data=response.data;
        initialLoading.value = false;
        startDate.value = response.data![0].startdate!;
        endDate.value = response.data![0].enddate!;
        description.value = response.data![0].descriptions!;
        taskName.value = response.data![0].taskName!;
      } else {
        AppSnackBar.error(message: response.message!);
      }
    }
}

