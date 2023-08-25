import 'package:bulkwork/src/methods/full_gym_details.dart';
import 'package:bulkwork/src/widgets/day_rect.dart';
import 'package:flutter/material.dart';

class FullWeekGym extends StatefulWidget {
  final String week;
  const FullWeekGym({super.key, required this.week});

  @override
  State<FullWeekGym> createState() => _FullWeekGymState();
}

class _FullWeekGymState extends State<FullWeekGym> {
  late int totalMuscles = 0;
  late int totalCompleted = 0;

  @override
  void initState() {
    super.initState();
    totalMuscles = 0;
    totalCompleted = 0;
    getProgress();
  }

  void getProgress() async {
    var tm = await FullGymExercise().total(week: widget.week);
    var cm = 1;
    // await completitionMusclesDetails().getTotalComplete(week: widget.week);
    setState(() {
      totalMuscles = tm!;
      totalCompleted = cm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/week.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 33, 26, 133),
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
                color: Color.fromARGB(255, 249, 249, 249)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(widget.week),
        ),
        body: Stack(
          children: [
            new ListView(
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      DayRect(
                        week: widget.week,
                        day: "Day 1",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DayRect(
                        week: widget.week,
                        day: "Day 2",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DayRect(
                        week: widget.week,
                        day: "Day 3",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DayRect(
                        week: widget.week,
                        day: "Day 4",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DayRect(
                        week: widget.week,
                        day: "Day 5",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DayRect(
                        week: widget.week,
                        day: "Day 6",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DayRect(
                        week: widget.week,
                        day: "Day 7",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
