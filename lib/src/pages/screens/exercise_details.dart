import 'package:bulkwork/src/methods/full_gym_exercise.dart';
import 'package:bulkwork/src/widgets/exercise_btn.dart';
import 'package:bulkwork/src/widgets/exercise_col_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final VoidCallback func;
  const CustomDialog({super.key, required this.title, required this.func});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text(title),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Exercise Name',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Sets',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Reps',
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [ElevatedButton(child: Text("Submit"), onPressed: () => func())],
    );
  }
}

class ExerciseDetails extends StatefulWidget {
  final String muscle, week, day;
  const ExerciseDetails(
      {super.key, required this.muscle, required this.week, required this.day});

  @override
  State<ExerciseDetails> createState() => _ExerciseDetailsState();
}

class _ExerciseDetailsState extends State<ExerciseDetails> {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  bool _isEnabled = false;
  String exersise = "";
  String reps = "";
  String sets = "";
  late List exercises;

  @override
  void initState() {
    super.initState();
    exercises = [];
    getExercise();
  }

  getExercise() async {
    exercises = await FullGymExerciseDetails()
        .getExercideDetails(week: widget.week, muscle: widget.muscle);
    setState(() {
      exercises = exercises;
    });
  }

  void addNewExercise() {
    print("dialog working...");
  }

  void editExistingExercise() {
    print("edit dialog working...");
  }

  @override
  Widget build(BuildContext context) {
    print(exercises);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              "assets/images/daymanage.png",
            ),
            fit: BoxFit.cover),
      ),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 33, 26, 133),
            leading: IconButton(
              icon: Icon(Icons.arrow_back,
                  color: Color.fromARGB(255, 249, 249, 249)),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text("Manage  |  ${widget.muscle} "),
          ),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 25, 9, 113),
                              Color.fromARGB(255, 125, 21, 108)
                            ],
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.day,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            ExerciseBtn(muscle: widget.muscle, Btn: () {}),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 500,
                      width: 350,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 40, 15, 184),
                            Color.fromARGB(255, 214, 26, 183)
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SingleChildScrollView(
                        child: exercises.length == 0
                            ? Container()
                            : Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "Exercise",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        width: 60,
                                      ),
                                      Text(
                                        "Sets",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Text(
                                        "Reps",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.center,
                                  //   children: [
                                  //     InkWell(
                                  //       onTap: () {
                                  //         showDialog(
                                  //           context: context,
                                  //           builder: (BuildContext context) {
                                  //             return CustomDialog(
                                  //                 title: "ex1",
                                  //                 func: editExistingExercise);
                                  //           },
                                  //         );
                                  //       },
                                  //       child: ExerciseColWidget(),
                                  //     ),
                                  //     SizedBox(
                                  //       width: 10,
                                  //     ),
                                  //     InkWell(
                                  //       onTap: () {},
                                  //       child: Icon(
                                  //         Icons.delete,
                                  //         color: Colors.white,
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  // SizedBox(
                                  //   height: 20,
                                  // ),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.center,
                                  //   children: [
                                  //     InkWell(
                                  //       onTap: () {},
                                  //       child: ExerciseColWidget(),
                                  //     ),
                                  //     SizedBox(
                                  //       width: 10,
                                  //     ),
                                  //     InkWell(
                                  //       onTap: () {},
                                  //       child: Icon(
                                  //         Icons.delete,
                                  //         color: Colors.white,
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  // SizedBox(
                                  //   height: 20,
                                  // ),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.center,
                                  //   children: [
                                  //     InkWell(
                                  //       onTap: () {},
                                  //       child: ExerciseColWidget(),
                                  //     ),
                                  //     SizedBox(
                                  //       width: 10,
                                  //     ),
                                  //     InkWell(
                                  //       onTap: () {},
                                  //       child: Icon(
                                  //         Icons.delete,
                                  //         color: Colors.white,
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  // SizedBox(
                                  //   height: 20,
                                  // ),
                                  // SizedBox(
                                  //   width: 10,
                                  // ),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.center,
                                  //   children: [
                                  //     InkWell(
                                  //       onTap: () {},
                                  //       child: exercises[0] != null
                                  //           ? ExerciseColWidget(
                                  //               exercise: exercises[0]["exercise"],
                                  //               reps: exercises[0]["reps"],
                                  //               sets: exercises[0]["sets"],
                                  //             )
                                  //           : Text(""),
                                  //     ),
                                  //     SizedBox(
                                  //       width: 10,
                                  //     ),
                                  //     InkWell(
                                  //       onTap: () {},
                                  //       child: Icon(
                                  //         Icons.delete,
                                  //         color: Colors.white,
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),

                                  Column(
                                    children: [
                                      for (int i = 0;
                                          i < exercises.length;
                                          i++) ...[
                                        ExerciseColWidget(
                                          exercise: exercises[i]["ex"],
                                          reps: exercises[i]["reps"],
                                          sets: exercises[i]["sets"],
                                        ),
                                      ]
                                    ],
                                  ),

                                  SizedBox(
                                    height: 20,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return CustomDialog(
                                              title: "Add the exercise",
                                              func: addNewExercise,
                                            );
                                          });
                                    },
                                    child: Icon(
                                      Icons.add,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextButton.icon(
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 12),
                                          textStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 228, 29, 221)),
                                          backgroundColor: Color.fromARGB(
                                              255, 211, 210, 210),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                        ),
                                        onPressed: () => {},
                                        icon: Icon(
                                          Icons.done,
                                          color:
                                              Color.fromARGB(255, 54, 7, 114),
                                        ),
                                        label: Text(
                                          'Completed',
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 54, 7, 114),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
