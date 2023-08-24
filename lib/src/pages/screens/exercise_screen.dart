import 'package:bulkwork/src/methods/full_gym_details.dart';
import 'package:bulkwork/src/methods/reset_full_gym_days.dart';
import 'package:bulkwork/src/methods/reset_full_gym_exercise.dart';
import 'package:bulkwork/src/models/full_gym.dart';
import 'package:bulkwork/src/pages/weeks/full_week_screen.dart';
import 'package:bulkwork/src/widgets/month_card.dart';
import 'package:bulkwork/src/widgets/progress_wid.dart';
import 'package:bulkwork/src/widgets/score_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  @override
  void initState() {
    super.initState();
    ResetFullGymDays();
    resetFullGymExercise();
  }

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
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      ScoreCard(label: "Highest Streak", score: "192"),
                      SizedBox(
                        width: 10,
                      ),
                      ScoreCard(label: "Current Streak", score: "93"),
                      SizedBox(
                        width: 20,
                      ),
                      MonthCard(month: "03")
                    ],
                  ),
                  SizedBox(
                    height: 130,
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.1),
                        child: ProgressWid(
                            label: "Week 1",
                            onPressed: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) =>
                                      FullWeekGym(week: "Week 1"),
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.1),
                        child: ProgressWid(
                            label: "Week 2",
                            onPressed: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) =>
                                      FullWeekGym(week: "Week 2"),
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.1),
                        child: ProgressWid(
                            label: "Week 3",
                            onPressed: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) =>
                                      FullWeekGym(week: "Week 3"),
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.1),
                        child: ProgressWid(
                            label: "Week 4",
                            onPressed: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) =>
                                      FullWeekGym(week: "Week 4"),
                                ),
                              );
                            }),
                      )
                    ],
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
