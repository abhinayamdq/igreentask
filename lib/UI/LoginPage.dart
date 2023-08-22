import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../Buttons.dart';
import '../Colors.dart';
import '../Controller/Login_page_controller.dart';
import '../roots/App roots.dart';
import 'HomeScreen.dart';

class LoginPage extends GetView<login_pageController> {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    login_pageController controllers = Get.put(login_pageController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: CustomColors.background),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    'asset/igreenLogo.png',
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                  ),
                ),
                Text("Welcome igreener's",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: controller.usercontroller,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(bottom: 23, top: 10, left: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Enter Mobile Number",
                    hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                    labelStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Obx(
                  () => TextFormField(
                    controller: controller.passwordcontroller,
                    obscureText: controller.pass.value,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.only(bottom: 23, top: 10, left: 10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter Password",
                      hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                      labelStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      suffixIcon: InkWell(
                        onTap: () {
                          controller.pass.value = !controller.pass.value;
                        },
                        child: Icon(controller.pass.value
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Forgot Password ?",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Button(
                      widthFactor: 0.8,
                      heightFactor: 0.06,
                      onPressed: () {
                        controller.loginCall();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                      child: const Text("Sign In",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600))),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Version 1.0")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
