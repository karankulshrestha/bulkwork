import 'package:bulkwork/src/features/utils/utils.dart';
import 'package:bulkwork/src/models/full_gym.dart';
import 'package:bulkwork/src/widgets/manageBtn.dart';
import 'package:bulkwork/src/widgets/muscle_btn.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_switch/flutter_switch.dart';

class CustomOption extends StatelessWidget {
  final String name;
  final VoidCallback? callback;
  const CustomOption({super.key, required this.name, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(70),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 255, 255, 255), spreadRadius: 1),
          ],
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 143, 23, 167),
            Color.fromARGB(255, 28, 9, 146)
          ])),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: callback,
        child: Text(name),
      ),
    );
  }
}

class DayManager extends ConsumerStatefulWidget {
  final String day, week;
  final FullGymDays fullGymDays;
  bool toggle;
  DayManager(
      {super.key,
      required this.fullGymDays,
      required this.day,
      required this.week,
      required this.toggle});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DayManagerState();
}

class _DayManagerState extends ConsumerState<DayManager> {
  List<String> muscles = [];
  final _fieldTextController = TextEditingController();
  bool isToggled = false;

  @override
  void initState() {
    super.initState();
    saveDayDetails();
  }

  saveDayDetails() {
    if (widget.fullGymDays.ex1 != null) {
      muscles.add(widget.fullGymDays.ex1!);
    }

    if (widget.fullGymDays.ex2 != null) {
      muscles.add(widget.fullGymDays.ex2!);
    }

    if (widget.fullGymDays.ex3 != null) {
      muscles.add(widget.fullGymDays.ex3!);
    }

    if (widget.fullGymDays.ex4 != null) {
      muscles.add(widget.fullGymDays.ex4!);
    }

    if (widget.fullGymDays.ex5 != null) {
      muscles.add(widget.fullGymDays.ex5!);
    }

    print("day manage: ${muscles.length}");
  }

  void removeMuscle(String name) async {
    String uid = await FirebaseAuth.instance.currentUser!.uid;

    if (widget.fullGymDays.ex1 == name) {
      widget.fullGymDays.ex1 = null;
    }

    if (widget.fullGymDays.ex2 == name) {
      widget.fullGymDays.ex2 = null;
    }

    if (widget.fullGymDays.ex3 == name) {
      widget.fullGymDays.ex3 = null;
    }

    if (widget.fullGymDays.ex4 == name) {
      widget.fullGymDays.ex4 = null;
    }

    if (widget.fullGymDays.ex5 == name) {
      widget.fullGymDays.ex5 = null;
    }

    await FirebaseFirestore.instance
        .collection("FullGymDays")
        .doc(uid)
        .collection(widget.week)
        .doc(uid)
        .collection(widget.day)
        .doc(uid)
        .set(widget.fullGymDays.toJson());
  }

  void setRestDay(bool value) async {
    String uid = await FirebaseAuth.instance.currentUser!.uid;

    widget.fullGymDays.restday = value;

    await FirebaseFirestore.instance
        .collection("FullGymDays")
        .doc(uid)
        .collection(widget.week)
        .doc(uid)
        .collection(widget.day)
        .doc(uid)
        .set(widget.fullGymDays.toJson());
  }

  void addMuscle(String name) async {
    String uid = await FirebaseAuth.instance.currentUser!.uid;

    if (widget.fullGymDays.ex1 == null) {
      widget.fullGymDays.ex1 = name;
    } else if (widget.fullGymDays.ex2 == null) {
      widget.fullGymDays.ex2 = name;
    } else if (widget.fullGymDays.ex3 == null) {
      widget.fullGymDays.ex3 = name;
    } else if (widget.fullGymDays.ex4 == null) {
      widget.fullGymDays.ex4 = name;
    } else if (widget.fullGymDays.ex5 == null) {
      widget.fullGymDays.ex5 = name;
    }

    await FirebaseFirestore.instance
        .collection("FullGymDays")
        .doc(uid)
        .collection(widget.week)
        .doc(uid)
        .collection(widget.day)
        .doc(uid)
        .set(widget.fullGymDays.toJson());
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    Widget optionOne = SimpleDialogOption(
      child: CustomOption(
        name: "Abs",
        callback: () {
          if (muscles.contains("Abs")) {
            showSnackBar(context, "Already exist in the day");
          } else {
            if (muscles.length < 5) {
              addMuscle("Abs");
              setState(() {
                muscles = [...muscles, "Abs"];
              });
            } else {
              showSnackBar(context, "Maximum 5 muscles are allowed");
            }
          }
        },
      ),
    );

    Widget optionTwo = SimpleDialogOption(
      child: CustomOption(
        name: "Chest",
        callback: () {
          if (muscles.contains("Chest")) {
            showSnackBar(context, "Already exist in the day");
          } else {
            if (muscles.length < 5) {
              addMuscle("Chest");
              setState(() {
                muscles = [...muscles, "Chest"];
              });
            } else {
              showSnackBar(context, "Maximum 5 muscles are allowed");
            }
          }
        },
      ),
    );

    Widget optionThree = SimpleDialogOption(
      child: CustomOption(
        name: "Shoulders",
        callback: () {
          if (muscles.contains("Shoulders")) {
            showSnackBar(context, "Already exist in the day");
          } else {
            if (muscles.length < 5) {
              addMuscle("Shoulders");
              setState(() {
                muscles = [...muscles, "Shoulders"];
              });
            } else {
              showSnackBar(context, "Maximum 5 muscles are allowed");
            }
          }
        },
      ),
    );

    Widget optionFour = SimpleDialogOption(
      child: CustomOption(
        name: "Legs",
        callback: () {
          if (muscles.contains("Legs")) {
            showSnackBar(context, "Already exist in the day");
          } else {
            if (muscles.length < 5) {
              addMuscle("Legs");
              setState(() {
                muscles = [...muscles, "Legs"];
              });
            } else {
              showSnackBar(context, "Maximum 5 muscles are allowed");
            }
          }
        },
      ),
    );

    Widget optionFive = SimpleDialogOption(
      child: CustomOption(
        name: "Back",
        callback: () {
          if (muscles.contains("Back")) {
            showSnackBar(context, "Already exist in the day");
          } else {
            if (muscles.length < 5) {
              addMuscle("Back");
              setState(() {
                muscles = [...muscles, "Back"];
              });
            } else {
              showSnackBar(context, "Maximum 5 muscles are allowed");
            }
          }
        },
      ),
    );

    Widget optionSix = SimpleDialogOption(
      child: CustomOption(
        name: "Biceps",
        callback: () {
          if (muscles.contains("Biceps")) {
            showSnackBar(context, "Already exist in the day");
          } else {
            if (muscles.length < 5) {
              addMuscle("Biceps");
              setState(() {
                muscles = [...muscles, "Biceps"];
              });
            } else {
              showSnackBar(context, "Maximum 5 muscles are allowed");
            }
          }
        },
      ),
    );

    Widget optionSeven = SimpleDialogOption(
      child: CustomOption(
        name: "Triceps",
        callback: () {
          if (muscles.contains("Triceps")) {
            showSnackBar(context, "Already exist in the day");
          } else {
            if (muscles.length < 5) {
              addMuscle("Triceps");
              setState(() {
                muscles = [...muscles, "Triceps"];
              });
            } else {
              showSnackBar(context, "Maximum 5 muscles are allowed");
            }
          }
        },
      ),
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 33, 26, 133),
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
                color: Color.fromARGB(255, 249, 249, 249)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("Manage  |  ${widget.week}  |  ${widget.day}"),
        ),
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.001),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/daymanage.png"),
                    fit: BoxFit.cover),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            ...muscles.map(
                              (e) => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: ManageBtn(muscle: e),
                                  ),
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 135, 14, 159),
                                      borderRadius: BorderRadius.circular(90),
                                    ),
                                    child: IconButton(
                                      iconSize: 20,
                                      onPressed: () {
                                        int index = muscles.indexOf(e);
                                        if (muscles.length > 2) {
                                          removeMuscle(e);
                                          setState(() {
                                            muscles = List.from(muscles)
                                              ..removeAt(index);
                                          });
                                        } else {
                                          showSnackBar(context,
                                              "Minimum 2 Exercises required");
                                        }
                                      },
                                      icon: Icon(Icons.delete),
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 250,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0))),
                                      backgroundColor:
                                          Color.fromARGB(255, 255, 255, 255),
                                      title: Text(
                                        "Select the Muscle to Add",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 28, 28, 28),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      content: Container(
                                        height: 500,
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                        width: double.maxFinite,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Expanded(
                                              child: ListView(
                                                shrinkWrap: true,
                                                children: <Widget>[
                                                  optionOne,
                                                  optionTwo,
                                                  optionThree,
                                                  optionFour,
                                                  optionFive,
                                                  optionSix,
                                                  optionSeven
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 240, 30, 156),
                                  elevation: 12.0,
                                  textStyle:
                                      const TextStyle(color: Colors.white)),
                              child: const Text(
                                'Click to Add Muscles',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // Container(
                          //   width: 250,
                          //   height: 40,
                          //   child: ElevatedButton(
                          //     onPressed: () {
                          //       showDialog(
                          //         context: context,
                          //         builder: (context) => AlertDialog(
                          //           title: Text('Enter new muscle'),
                          //           content: TextField(
                          //             controller: _fieldTextController,
                          //             decoration: InputDecoration(
                          //                 hintText: 'Name of the new muscle'),
                          //           ),
                          //           actions: [
                          //             TextButton(
                          //               onPressed: () {
                          //                 String muscleName =
                          //                     _fieldTextController.text;
                          //                 if (muscleName.length > 9) {
                          //                   showSnackBar(context,
                          //                       "Maximum 9 chars allowed");
                          //                 } else {
                          //                   if (muscles.contains(muscleName)) {
                          //                     showSnackBar(context,
                          //                         "Already exist in the day");
                          //                   } else {
                          //                     if (muscles.length < 5) {
                          //                       addMuscle(muscleName);
                          //                       setState(
                          //                         () {
                          //                           muscles = [
                          //                             ...muscles,
                          //                             muscleName
                          //                           ];
                          //                         },
                          //                       );
                          //                     } else {
                          //                       showSnackBar(context,
                          //                           "Maximum 5 muscles are allowed");
                          //                     }
                          //                   }
                          //                 }
                          //               },
                          //               child: Text('Submit'),
                          //             ),
                          //           ],
                          //         ),
                          //       );
                          //     },
                          //     style: ElevatedButton.styleFrom(
                          //       backgroundColor: Colors.purple,
                          //       elevation: 12.0,
                          //       textStyle: const TextStyle(color: Colors.white),
                          //     ),
                          //     child: const Text(
                          //       'Add Muscle Manually',
                          //       style: TextStyle(fontWeight: FontWeight.bold),
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MuscleBtn(
                                muscle: "Enable/Disable Rest Day",
                                Btn: () {},
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              FlutterSwitch(
                                height: 40.0,
                                width: 60.0,
                                padding: 4.0,
                                toggleSize: 30.0,
                                borderRadius: 30.0,
                                activeColor: Colors.purple,
                                value: widget.toggle,
                                onToggle: (value) {
                                  setState(() {
                                    widget.toggle = value;
                                  });
                                  setRestDay(value);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
