import 'package:flutter/material.dart';
import 'package:igreen_taskapprovel/Approvel.dart';

import 'Colors.dart';

class Notify extends StatefulWidget {
  const Notify({Key? key}) : super(key: key);

  @override
  State<Notify> createState() => _NotificationState();
}

class _NotificationState extends State<Notify> {
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
            child: Text("Notification",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, position) {
          return Container(
            padding: EdgeInsets.only(right: 10, left: 10, top: 10),
            width: MediaQuery.of(context).size.width,
            child: Wrap(
              children: [
                Card(
                  color: CustomColors.lightgrey,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  shadowColor: Colors.black,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Approvel()));
                    },
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
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                "00/00/00",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
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
                                  "Pipes for approval",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ); // Container(
        },
        itemCount: 10,
      ),
    );
  }
}
