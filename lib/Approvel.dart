import 'package:flutter/material.dart';
import 'package:igreen_taskapprovel/Reject.dart';

import 'Colors.dart';

class Approvel extends StatefulWidget {
  const Approvel({Key? key}) : super(key: key);

  @override
  State<Approvel> createState() => _ApprovelState();
}

class _ApprovelState extends State<Approvel> {
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
                "Approval",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, position) {
          final count = position + 1;
          return Container(
            child: Column(children: [
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(right: 10, left: 10),
                width: MediaQuery.of(context).size.width,
                child: Wrap(
                  children: [
                    Card(
                      color: Colors.yellow.shade50,
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
                            Text(
                              "$count. ",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 7,
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
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  softWrap: true,
                                  "Project Status",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 47.7),
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
                                    "Inprogress",
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
                                  "Project Expected Date",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
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
                                    "00/00/00",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Material(
                                    elevation: 5,
                                    borderRadius: BorderRadius.circular(15),
                                    color: CustomColors.brand,
                                    child: MaterialButton(
                                      minWidth: 20,
                                      onPressed: () => _showToast(context),
                                      child: Text("Accept",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Material(
                                    elevation: 5,
                                    borderRadius: BorderRadius.circular(15),
                                    color: CustomColors.brand,
                                    child: MaterialButton(
                                      minWidth: 20,
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Reject(
                                                      records: [],
                                                    )));
                                      },
                                      child: Text("Reject",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ), // Container(
            ]),
          );
        },
        itemCount: 10,
      ),
    );
  }
}

void _showToast(BuildContext context) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    const SnackBar(
      duration: Duration(seconds: 1),
      content: Text('Accepted',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
          )),
    ),
  );
}
