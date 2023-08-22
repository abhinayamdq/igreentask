import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../Buttons.dart';
import '../Colors.dart';
import '../Controller/TaskAssignedController.dart';
import 'LoginPage.dart';



class TaskAssigned extends GetView<TaskAssignedController> {
  TaskAssigned({Key? key}) : super(key: key);

  Future<void> selectDate1(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: Color(0xff84cb25),
              colorScheme: ColorScheme.light(primary: Color(0xff84cb25))
                  .copyWith(secondary: Color(0xff84cb25)),
            ),
            child: child!,
          );
        });
    if (picked != null) {
      controller.projectdatecontroller.text =
          DateFormat('yyyy-MM-dd').format(picked);
    }
  }
  Future<void> selectDate2(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: Color(0xff84cb25),
              colorScheme: ColorScheme.light(primary: Color(0xff84cb25))
                  .copyWith(secondary: Color(0xff84cb25)),
            ),
            child: child!,
          );
        });
    if (picked != null) {
      controller.completiondatecontroler.text =
          DateFormat('yyyy-MM-dd').format(picked);
    }
  }
  Future<void> selectDate3(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: Color(0xff84cb25),
              colorScheme: ColorScheme.light(primary: Color(0xff84cb25))
                  .copyWith(secondary: Color(0xff84cb25)),
            ),
            child: child!,
          );
        });
    if (picked != null) {
      controller.deadlinecontroler.text =
          DateFormat('yyyy-MM-dd').format(picked);
    }
  }
  @override
  Widget build(BuildContext context) {
    TaskAssignedController controller =Get.put(TaskAssignedController());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: CustomColors.lightviolet,
          toolbarHeight: 60,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black, // customize color as per requirement
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              }),
          title: Text("Task List",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              )),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Task Name",
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Task code",
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    TextFormField(
                      controller: controller.projectdatecontroller,
                      style: TextStyle(color: Colors.black),
                      readOnly: true,
                      decoration: InputDecoration(
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 15),
                          suffixIcon: Icon(Icons.calendar_today),
                          border: OutlineInputBorder(),
                          labelText: 'Project Start Date',
                        labelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      onTap: () {
                        selectDate1(context);
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: controller.completiondatecontroler,
                      style: TextStyle(color: Colors.black),
                      readOnly: true,
                      decoration: InputDecoration(
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 15),
                          suffixIcon: Icon(Icons.calendar_today),
                          border: OutlineInputBorder(),
                          labelText: 'Expected Completion Date',
                        labelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      onTap: () {
                        selectDate2(context);
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: controller.deadlinecontroler,
                  style: TextStyle(color: Colors.black),
                  readOnly: true,
                  decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 15),
                    suffixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(),
                    labelText: 'Deadline',
                    labelStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  onTap: () {
                    selectDate3(context);
                  },),

                    SizedBox(
                      height: 15,
                    ),
                    DropdownButtonFormField<String>(
                      //value: _selectedOption2,
                      isExpanded: true,
                      items: <String>['1452', '125']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        newValue!;
                        controller.Typecontroller.text = newValue;
                      },
                      decoration: const InputDecoration(
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 15),
                        hintText: 'Task Type',
                        labelText: 'Task Type',
                        labelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    DropdownButtonFormField<String>(
                      //value: _selectedOption2,
                      isExpanded: true,
                      items:
                      <String>['eng', 'tam','soc'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        newValue!;
                        controller.Typecontroller.text = newValue;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        hintText: 'Department',
                        labelText: 'Department',
                        labelStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                        border: OutlineInputBorder(
                         ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    DropdownButtonFormField<String>(
                      //value: _selectedOption2,
                      isExpanded: true,
                      items:
                      <String>['water', 'land','soil'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        newValue!;
                        controller.Typecontroller.text = newValue;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        hintText: 'Resources',
                        labelText: 'Resources',
                        labelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                           ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Project Description',
                        labelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(), // Optional border
                      ),),

                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Button(
                          widthFactor: 0.8,
                          heightFactor: 0.06,
                          // onPressed: () {
                          //   controller.();
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(builder: (context) => HomeScreen()),
                          //   );
                          // },
                          child: const Text("Sumbit",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600))),
                    ),
                  ])
          ),
        )

    );
  }
  }









