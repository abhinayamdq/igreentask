import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Api/Api connet.dart';
import '../AppSnackBar.dart';
import '../pojo/Resources.dart';


class TaskAssignedController extends GetxController
    with WidgetsBindingObserver {
  final ApiConnect _connect = Get.put(ApiConnect());
  RxInt currentIndex = 0.obs;
  RxList EmployeeList = RxList();
  RxBool Name = RxBool(false);
  RxBool Type = RxBool(false);
  RxBool code = RxBool(false);
  RxBool departmentId = RxBool(false);
  RxBool startDate = RxBool(false);
  RxBool endDate = RxBool(false);
  RxBool expectedCompletionDate = RxBool(false);
  RxBool descriptions = RxBool(false);
  RxBool initialLoading = RxBool(true);
  RxBool isGet = RxBool(false);
  RxString employeeId = RxString("");
  RxString employeeName = RxString("");
  RxInt SelectIndex = RxInt(0);
  List<Data>? data;
  void onInit() {
    super.onInit();

  }
  TextEditingController EmployeeListController = TextEditingController();
  TextEditingController TaskNameController = TextEditingController();
  TextEditingController TaskCodeController = TextEditingController();
  TextEditingController TaskTypeController = TextEditingController();
  TextEditingController DepartmentController = TextEditingController();
  TextEditingController ProjectdateController = TextEditingController();
  TextEditingController CompletiondateController = TextEditingController();
  TextEditingController DeadlineController = TextEditingController();
  TextEditingController ResourcesController = TextEditingController();
  TextEditingController DescriptionController = TextEditingController();
  @override

  textFieldValidation() async {
    if (TaskNameController.value.text.isEmpty) {
      Name.value = true;
      Fluttertoast.showToast(
        msg: "Please enter Your Name!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return;
    }
    if (TaskCodeController.value.text.isEmpty) {
      code.value = true;
      Fluttertoast.showToast(
        msg: "Please enter Email!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return;
    }
    if (TaskTypeController.value.text.isEmpty) {
      Type.value = true;
      Fluttertoast.showToast(
        msg: "Please enter Mobile Number!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return;
    }
    if (DepartmentController.value.text.isEmpty) {
      departmentId.value = true;
      Fluttertoast.showToast(
        msg: "Please enter Alternate Mobile Number!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return;
    }
    if (ProjectdateController.value.text.isEmpty) {
      startDate.value = true;
      Fluttertoast.showToast(
        msg: "Please enter Mobile Number!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return;
    }
    if (CompletiondateController.value.text.isEmpty) {
      expectedCompletionDate.value = true;
      Fluttertoast.showToast(
        msg: "Please enter Alternate Mobile Number!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return;
    }
    if (DeadlineController.value.text.isEmpty) {
      endDate.value = true;
      Fluttertoast.showToast(
        msg: "Please enter Alternate Mobile Number!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return;
    }
    if (DescriptionController.value.text.isEmpty) {
      descriptions.value = true;
      Fluttertoast.showToast(
        msg: "Please enter Alternate Mobile Number!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return;
    }

    Map<String, String> payLoad = {
      'Name': TaskNameController.value.text.toString(),
      'code': TaskCodeController.value.text.toString(),
      'Type': TaskTypeController.value.text.toString(),
      'departmentId': DepartmentController.value.text.toString(),
      'startDate': ProjectdateController.value.text.toString(),
      'expectedCompletionDate': CompletiondateController.value.text.toString(),
      'endDate': DeadlineController.value.text.toString(),
      'descriptions': DescriptionController.value.text.toString(),
    };
    var Response = await _connect.TaskCreate(payLoad);
      if (!Response.error!) {
        AppSnackBar.success(message: Response.message!);
      } else {
        AppSnackBar.error(message: Response.message!);
      }
    }

  resourcesDrop() async {
    var Response = await _connect.resourcesConnect();
    if (!Response.error!) {
      this.data=Response.data!;
      initialLoading.value = false;
      for (int i = 0; i < Response!.data!.length; i++) {
        EmployeeList.add(Response.data![i].employeeName);
      }
    } else {
      AppSnackBar.error(message: Response.message!);
    }
  }
}