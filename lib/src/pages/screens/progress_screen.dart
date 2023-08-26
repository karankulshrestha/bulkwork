import 'package:bulkwork/src/pages/progress/graph_btn.dart';
import 'package:bulkwork/src/pages/progress/graph_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              "assets/images/home.png",
            ),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Stack(
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 50),
                            // width: 300,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Progress Monitoring",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GraphButton(
                            title: "Squat (PR)",
                            func: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => GraphScreen(
                                    name: "Squat (PR)",
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GraphButton(
                              title: "Bench Press (PR)",
                              func: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => GraphScreen(
                                      name: "Bench Press (PR)",
                                    ),
                                  ),
                                );
                              }),
                          SizedBox(
                            height: 20,
                          ),
                          GraphButton(
                            title: "Deadlift (PR)",
                            func: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => GraphScreen(
                                    name: "Deadlift (PR)",
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GraphButton(
                            title: "Arm (Measurement)",
                            func: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => GraphScreen(
                                    name: "Arm (Measurement)",
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GraphButton(
                            title: "Chest (Measurement)",
                            func: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => GraphScreen(
                                    name: "Chest (Measurement)",
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GraphButton(
                            title: "Waist (Measurement)",
                            func: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => GraphScreen(
                                    name: "Waist (Measurement)",
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GraphButton(
                            title: "Bodyweight",
                            func: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => GraphScreen(
                                    name: "Bodyweight",
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GraphButton(
                            title: "Body fat percentage",
                            func: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => GraphScreen(
                                    name: "Body fat percentage",
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
