import 'package:flutter/material.dart';

class PendingView extends StatefulWidget {
  const PendingView({Key? key}) : super(key: key);

  @override
  State<PendingView> createState() => _PendingViewState();
}

class _PendingViewState extends State<PendingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffedecf6),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
        backgroundColor: Color(0xff7EC948),
        title: Container(
            padding: EdgeInsets.only(right: 25),
            child: Center(
              child: Text(
                "Pending",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )),
      ),
      body: SingleChildScrollView(),
    );
  }
}
