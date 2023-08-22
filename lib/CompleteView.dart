import 'package:flutter/material.dart';

class CompleteView extends StatefulWidget {
  const CompleteView({Key? key}) : super(key: key);

  @override
  State<CompleteView> createState() => _CompleteViewState();
}

class _CompleteViewState extends State<CompleteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffedecf6),
      appBar: AppBar(
        backgroundColor: Color(0xff7EC948),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
        title: Container(
            padding: EdgeInsets.only(right: 25),
            child: Center(
              child: Text(
                "Completed",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Text(""),
        ),
      ),
    );
  }
}
