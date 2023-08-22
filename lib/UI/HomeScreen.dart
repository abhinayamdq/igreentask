import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:igreen_taskapprovel/Approvel.dart';
import 'package:igreen_taskapprovel/Notification.dart';
import 'package:igreen_taskapprovel/Project.dart';
import 'package:igreen_taskapprovel/roots/App%20roots.dart';

import '../Colors.dart';
import 'TaskProjectList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      // appBar: AppBar(
      //   toolbarHeight: 100,
      //   backgroundColor: Color(0xff7EC948),
      //   shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
      // ),
      body: SafeArea(
        child: Container(
          color: CustomColors.background,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'asset/igreenLogo.png',
                    width: 120,
                    height: 100,
                  ),
                ),
              ),
              GridView(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 140),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  children: [
                    Card(
                      color: CustomColors.lightviolet,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 10,
                      shadowColor: Colors.black,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>TaskProjectList()),
                            );
                          },
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Image.asset(
                                      'asset/project.png',
                                      height: 50,
                                      width: 50,
                                    )),
                                Text(
                                  "Task Creation",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: CustomColors.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 10,
                      shadowColor: Colors.black,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(AppRoutes.Approvel.toName);
                          },
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Image.asset(
                                      'asset/approval.png',
                                      height: 50,
                                      width: 50,
                                    )),
                                Text(
                                  "Approval",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Card(
                    //   color: CustomColors.pink,
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(20),
                    //   ),
                    //   elevation: 10,
                    //   shadowColor: Colors.black,
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(20)),
                    //     child: InkWell(
                    //       onTap: () {
                    //         Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //                 builder: (context) => RecorderHomeView()));
                    //       },
                    //       child: Center(
                    //         child: Column(
                    //           mainAxisSize: MainAxisSize.min,
                    //           children: [
                    //             Container(
                    //                 decoration: BoxDecoration(
                    //                     borderRadius:
                    //                         BorderRadius.circular(100)),
                    //                 child: Image.asset(
                    //                   'asset/approval.png',
                    //                   height: 50,
                    //                   width: 50,
                    //                 )),
                    //             Text(
                    //               "Approval",
                    //               style: TextStyle(
                    //                   fontSize: 17,
                    //                   color: Colors.black,
                    //                   fontWeight: FontWeight.bold),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ]),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 5),
                child: Align(
                  alignment: Alignment.topRight,
                  child: FloatingActionButton(
                    backgroundColor: CustomColors.bellcolor,
                    foregroundColor: Colors.black,
                    mini: true,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Notify()));
                    },
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        side: BorderSide(color: CustomColors.brand)),
                    child: Icon(Icons.notifications_active),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
