import 'package:bulkwork/src/features/utils/utils.dart';
import 'package:bulkwork/src/methods/full_gym_exercise.dart';
import 'package:bulkwork/src/methods/progressMonitor.dart';
import 'package:bulkwork/src/widgets/exercise_btn.dart';
import 'package:bulkwork/src/widgets/exercise_col_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomDialog extends StatelessWidget {
  final String title, muscle, week;
  final void Function(String name, String reps, String sets) addy;
  const CustomDialog(
      {super.key,
      required this.title,
      required this.muscle,
      required this.week,
      required this.addy});

  @override
  Widget build(BuildContext context) {
    TextEditingController _exController = new TextEditingController();
    TextEditingController _reps = new TextEditingController();
    TextEditingController _sets = new TextEditingController();

    return AlertDialog(
      scrollable: true,
      title: Text(title),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _exController,
                decoration: InputDecoration(
                  labelText: 'Exercise Name',
                ),
              ),
              TextFormField(
                controller: _sets,
                decoration: InputDecoration(
                  labelText: 'Sets',
                ),
              ),
              TextFormField(
                controller: _reps,
                decoration: InputDecoration(
                  labelText: 'Reps',
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
            child: Text("Submit"),
            onPressed: () => {
                  addy(_exController.text, _reps.text, _sets.text),
                  FullGymExerciseDetails().registerExercise(
                      week: week,
                      ex: _exController.text,
                      muscle: muscle,
                      reps: _reps.text,
                      sets: _sets.text),
                })
      ],
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
  late bool status;

  @override
  void initState() {
    super.initState();
    exercises = [];
    getExercise();
    status = false;
    getExerciseStatus();
  }

  getExerciseStatus() async {
    status = await completitionMusclesDetails().getCompleteStatus(
        muscle: widget.muscle, week: widget.week, day: widget.day);
    setState(() {
      status = status;
    });
  }

  getExercise() async {
    exercises = await FullGymExerciseDetails()
        .getExercideDetails(week: widget.week, muscle: widget.muscle);
    setState(() {
      exercises = exercises;
    });
  }

  void addNewExercise(String name, String reps, String sets) {
    if (exercises.length > 5) {
      showSnackBar(context, "Maximum 5 exercise allowed");
    } else {
      exercises = [
        ...exercises,
        [
          {
            "ex": name,
            "sets": sets,
            "reps": reps,
          }
        ]
      ];
    }
  }

  Future deleteExercise(int index) async {
    var obj = exercises[index];
    await FirebaseFirestore.instance
        .collection("FullGymExDetails")
        .doc(obj["id"])
        .delete();
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
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                            exercises.length == 0
                                ? CircularProgressIndicator(
                                    color: Colors.pink,
                                  )
                                : Column(
                                    children: [
                                      for (int i = 0;
                                          i < exercises.length;
                                          i++) ...[
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {},
                                                child: exercises[0] != null
                                                    ? ExerciseColWidget(
                                                        exercise: exercises[i]
                                                            ["ex"],
                                                        reps: exercises[i]
                                                            ["reps"],
                                                        sets: exercises[i]
                                                            ["sets"],
                                                      )
                                                    : Text(""),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  if (exercises.length > 2) {
                                                    await deleteExercise(i);
                                                    setState(() {
                                                      exercises =
                                                          List.from(exercises)
                                                            ..removeAt(i);
                                                    });
                                                  } else {
                                                    showSnackBar(context,
                                                        "Minimum 2 exercise required");
                                                  }
                                                },
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
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
                                        muscle: widget.muscle,
                                        week: widget.week,
                                        addy: (String name, String reps,
                                            String set) {
                                          setState(() {
                                            exercises = [
                                              ...exercises,
                                              {
                                                "ex": name,
                                                "sets": set,
                                                "reps": reps,
                                              }
                                            ];
                                          });
                                        },
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
                            exercises.length == 0
                                ? Container()
                                : ElevatedButton(
                                    child: Text('Mark Complete'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: status == false
                                          ? Colors.grey
                                          : Colors.green,
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    onPressed: () {
                                      completitionMusclesDetails().setComplete(
                                          muscle: widget.muscle,
                                          week: widget.week,
                                          day: widget.day,
                                          status: !status);

                                      setState(() {
                                        status = !status;
                                      });
                                    },
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
