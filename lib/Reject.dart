import 'dart:io';

import 'package:flutter/material.dart';
import 'package:igreen_taskapprovel/recorded_list_view.dart';
import 'package:igreen_taskapprovel/recorder_view.dart';
import 'package:path_provider/path_provider.dart';

import 'Colors.dart';

class Reject extends StatefulWidget {
  final List<String> records;

  const Reject({
    Key? key,
    required this.records,
  }) : super(key: key);

  @override
  State<Reject> createState() => _RejectState();
}

class _RejectState extends State<Reject> {
  final formfield = GlobalKey<FormState>();
  final reason = TextEditingController();
  bool _validate = false;
  late Directory appDirectory;
  late final erase;
  List<String> records = [];

  late int _totalDuration;
  late int _currentDuration;
  double _completedPercentage = 0.0;
  bool _isPlaying = false;
  int _selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    getApplicationDocumentsDirectory().then((value) {
      appDirectory = value;
      appDirectory.list().listen((onData) {
        if (onData.path.contains('.aac')) records.add(onData.path);
        print("PATH");
        print(onData.path);
      }).onDone(() {
        records = records.reversed.toList();
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    appDirectory.delete();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
        backgroundColor: CustomColors.brand,
        title: Container(
            padding: EdgeInsets.only(right: 25),
            child: Center(
              child: Text(
                "Feedback",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            right: 10,
            left: 12,
          ),
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      color: CustomColors.pink1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      shadowColor: Colors.black,
                      child: Container(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  softWrap: true,
                                  "Project Assigned By",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    ": ",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    maxLines: null,
                                    softWrap: true,
                                    "Vel",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  softWrap: true,
                                  "Project Assigned To",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    ": ",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    maxLines: null,
                                    softWrap: true,
                                    "Bala",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  softWrap: true,
                                  "Project Description",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    ": ",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    maxLines: null,
                                    softWrap: true,
                                    "Pipes",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 3),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        child: RecordListView(
                          records: records,
                        ),
                      ),
                    ),
                    RecorderView(
                      onSaved: _onRecordComplete,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 40,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Reason",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Form(
              key: formfield,
              child: Container(
                padding: EdgeInsets.only(
                  top: 5,
                ),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: reason,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding:
                        EdgeInsets.only(bottom: 100, top: 10, left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Enter Your Reason',
                    hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                    isCollapsed: true,
                    errorText: _validate ? 'Field Cannot Be Empty' : null,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(15),
              color: CustomColors.brand,
              child: MaterialButton(
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  onPressed: () {
                    setState(() {
                      reason.text.isEmpty
                          ? _validate = true
                          : _validate = false;
                    });
                  },
                  child: const Text(
                    "Submit",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(
              height: 30,
            )
          ]),
        ),
      ),
    );
  }

  _onRecordComplete() {
    records.clear();
    appDirectory.list().listen((onData) {
      if (onData.path.contains('.aac')) records.add(onData.path);
    }).onDone(() {
      records.sort();
      records = records.reversed.toList();
      setState(() {});
    });
  }
}
