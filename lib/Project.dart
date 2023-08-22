import 'package:flutter/material.dart';
import 'package:igreen_taskapprovel/Colors.dart';

class Project extends StatefulWidget {
  const Project({Key? key}) : super(key: key);

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  PENDING() {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, position) {
        final count = position + 1;
        return Container(
          padding: EdgeInsets.only(right: 10, left: 10),
          child: Wrap(
            direction: Axis.horizontal,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  color: CustomColors.lightpink,
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
                        // SizedBox(
                        //   height: 30,
                        // ),
                        // Container(
                        //   padding: EdgeInsets.only(right: 10),
                        //   child: Align(
                        //     alignment: Alignment.bottomRight,
                        //     child: Material(
                        //       elevation: 5,
                        //       borderRadius: BorderRadius.circular(15),
                        //       color: Color(0xff7EC948),
                        //       child: MaterialButton(
                        //         minWidth: 20,
                        //         onPressed: () {
                        //           Navigator.push(
                        //               context,
                        //               MaterialPageRoute(
                        //                   builder: (context) => PendingView()));
                        //         },
                        //         child: Text("View",
                        //             style: TextStyle(color: Colors.white)),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      itemCount: 10,
    );
  }

  COMPLETED() {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, position) {
        final count = position + 1;
        return Container(
          padding: EdgeInsets.only(right: 10, left: 10),
          child: Wrap(
            direction: Axis.horizontal,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  color: CustomColors.lightgreen,
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
                              "$count. Completed Description",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
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
                                "Completed",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),

                        // SizedBox(
                        //   height: 30,
                        // ),
                        // Container(
                        //   padding: EdgeInsets.only(right: 10),
                        //   child: Align(
                        //     alignment: Alignment.bottomRight,
                        //     child: Material(
                        //       elevation: 5,
                        //       borderRadius: BorderRadius.circular(15),
                        //       color: Color(0xff7EC948),
                        //       child: MaterialButton(
                        //         minWidth: 20,
                        //         onPressed: () {
                        //           Navigator.push(
                        //               context,
                        //               MaterialPageRoute(
                        //                   builder: (context) => CompleteView()));
                        //         },
                        //         child: Text("View",
                        //             style: TextStyle(color: Colors.white)),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      itemCount: 10,
    );
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
            child: Text("Project",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            GridView(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 50,
                ),
                children: [
                  Card(
                    color: CustomColors.brand,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
                    shadowColor: Colors.black,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: InkWell(
                        // onTap: () {
                        //   Navigator.push(context,
                        //       MaterialPageRoute(builder: (context) => Project()));
                        // },
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "5",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Pending",
                                style: TextStyle(
                                    fontSize: 13,
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
                    color: CustomColors.brand,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
                    shadowColor: Colors.black,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "10",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Completed",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
            Container(
              padding: EdgeInsets.only(top: 130),
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    TabBar(
                        indicatorColor: Colors.green.shade200,
                        indicatorWeight: 4.0,
                        unselectedLabelColor: Color(0xffedecf6),
                        labelColor: Color(0xffedecf6),
                        isScrollable: true,
                        controller: _tabController,
                        tabs: [
                          Tab(
                            child: Text(
                              "Pending",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Completed",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0),
                            ),
                          ),
                        ]),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [PENDING(), COMPLETED()],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
