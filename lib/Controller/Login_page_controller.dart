import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../Api/Api connet.dart';
import '../AppSnackBar.dart';
import '../preference.dart';
import '../roots/App roots.dart';

class login_pageController extends GetxController {
  TextEditingController usercontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  RxBool pass = RxBool(true);
  RxBool isPhoneNoError = RxBool(false);
  RxBool isPasswordError = RxBool(false);
  final ApiConnect _connect = Get.put(ApiConnect());

  @override
  void onInit() async {
    super.onInit();
  }

  loginCall() async {
    isPhoneNoError.value = false;
    isPasswordError.value = false;
    // try {
    if (usercontroller.value.text.length != 10) {
      isPhoneNoError.value = true;
      Fluttertoast.showToast(
        msg: "Please enter Phone Number!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return;
    }
    if (passwordcontroller.value.text.isEmpty) {
      isPasswordError.value = true;
      Fluttertoast.showToast(
        msg: "Please enter Company Code!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return;
    }
    Map<String, dynamic> payload = {
      'MobileNum': usercontroller.value.text.toString(),
      'Password': passwordcontroller.value.text.toString(),
      'Latitude': "13.0593475",
      'Longitude': "80.1750657",
      'Device': "Android",
    };
    print(payload);

    var response = await _connect.loginConnect(payload);
    if (!response.error!) {
      AppSnackBar.success(message: response.message!);
      AppPreference().updateMobileNumber(usercontroller.value.text.toString());
      Get.toNamed(AppRoutes.Home.toName);
      update();
    } else {
      AppSnackBar.error(message: response.message!);
    }
  }
} //   on ValidationException catch (e) {
//   debugPrint("_Exception  ${e.toString()}");
//   } catch (e) {
//   debugPrint("_Exception  ${e.toString()}");
//   }
// }
