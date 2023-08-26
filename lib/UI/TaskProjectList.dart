import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:provider/provider.dart';

import '../Colors.dart';
import '../Controller/TaskProjectListController.dart';
import '../provider/Data provider.dart';
import 'LoginPage.dart';
import 'TaskAssigned.dart';

class TaskProjectList extends GetView<TaskProjectListController> {
  const TaskProjectList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TaskProjectListController controller = Get.put(TaskProjectListController());
    // controller.userDataProvider =
    //     Provider.of<DataProvider>(context, listen: false);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (!controller.isGet.value) {
        controller.getTaskList();
        controller.isGet.value = true;
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff84cb25),
        toolbarHeight: 60,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white, // customize color as per requirement
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            }),
        title: Text("Task List",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            )),
        centerTitle: true,
      ),
      body:Obx (()=>controller.initialLoading.isFalse? Container(
          height: MediaQuery.of(context).size.height * 0.7,
          width: double.infinity,
          child:
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 1,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 25.0,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2.0,
                                blurRadius: 4.0,
                                offset:
                                    Offset(0, 2), // Set the elevation values
                              ),
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 5.0,
                            ), Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                            // SizedBox(width: 20.0,),
                            Padding(
                            padding: EdgeInsets.all(10.0),
                                child: Container(
                                  width:30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color(0xff84cb25),
                                    shape: BoxShape.circle, // Set the border radius
                                  ),
                                  child: Text(
                                    controller.taskName.value,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )),]),
                            Padding(
                              padding: EdgeInsets.fromLTRB(15, 2, 2, 2),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Description:",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        controller.description.value,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(15, 2, 2, 2),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Project Start Date:",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        controller.startDate.value,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(15, 2, 2, 2),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Deadline:",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        controller.endDate.value,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
          )):Container()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TaskAssigned(),
              ));
        },
        backgroundColor: Color(0xff84cb25),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
