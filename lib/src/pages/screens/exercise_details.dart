import 'package:bulkwork/src/widgets/exercise_btn.dart';
import 'package:bulkwork/src/widgets/exercise_col_widget.dart';
import 'package:bulkwork/src/widgets/manageBtn.dart';
import 'package:bulkwork/src/widgets/muscle_btn.dart';
import 'package:flutter/material.dart';

class ExerciseDetails extends StatefulWidget {
  final String exercise, week, day;
  const ExerciseDetails(
      {super.key,
      required this.exercise,
      required this.week,
      required this.day});

  @override
  State<ExerciseDetails> createState() => _ExerciseDetailsState();
}

class _ExerciseDetailsState extends State<ExerciseDetails> {
  @override
  Widget build(BuildContext context) {
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
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 33, 26, 133),
            leading: IconButton(
              icon: Icon(Icons.arrow_back,
                  color: Color.fromARGB(255, 249, 249, 249)),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text("Manage  |  ${widget.exercise} "),
          ),
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
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
                        ExerciseBtn(muscle: widget.exercise, Btn: () {}),
                      ],
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Exercise",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              Text(
                                "Sets",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
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
                          ExerciseColWidget(),
                          SizedBox(
                            height: 20,
                          ),
                          ExerciseColWidget(),
                          SizedBox(
                            height: 20,
                          ),
                          ExerciseColWidget(),
                          SizedBox(
                            height: 20,
                          ),
                          ExerciseColWidget(),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton.icon(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.all(10),
                                  textStyle: TextStyle(
                                      color: Color.fromARGB(255, 194, 25, 186)),
                                  backgroundColor:
                                      Color.fromARGB(255, 219, 217, 217),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                ),
                                onPressed: () => {},
                                icon: Icon(
                                  Icons.edit,
                                  color: Color.fromARGB(255, 54, 7, 114),
                                ),
                                label: Text(
                                  'Edit Exercise',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 54, 7, 114),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              TextButton.icon(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.all(10),
                                  textStyle: TextStyle(
                                      color: Color.fromARGB(255, 228, 29, 221)),
                                  backgroundColor:
                                      Color.fromARGB(255, 211, 210, 210),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                ),
                                onPressed: () => {},
                                icon: Icon(
                                  Icons.done,
                                  color: Color.fromARGB(255, 54, 7, 114),
                                ),
                                label: Text(
                                  'Completed',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 54, 7, 114),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          )
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
    );
  }
}
