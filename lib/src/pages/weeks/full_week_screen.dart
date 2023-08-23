import 'package:bulkwork/src/widgets/day_rect.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class FullWeekGym extends StatefulWidget {
  final String week;
  const FullWeekGym({super.key, required this.week});

  @override
  State<FullWeekGym> createState() => _FullWeekGymState();
}

class _FullWeekGymState extends State<FullWeekGym> {
  @override
  void initState() {
    super.initState();
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
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.03,
                  horizontal: MediaQuery.of(context).size.width * 0.1),
              child: new LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 80,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2500,
                percent: 0.8,
                center: Text(
                  "50%",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                barRadius: const Radius.circular(20),
                progressColor: Color.fromARGB(255, 40, 220, 20),
              ),
            ),
            new ListView(
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80,
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
