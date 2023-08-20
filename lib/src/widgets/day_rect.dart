import 'package:bulkwork/src/widgets/muscle_btn.dart';
import 'package:flutter/material.dart';

class DayRect extends StatefulWidget {
  final String week, day;
  const DayRect({super.key, required this.week, required this.day});

  @override
  State<DayRect> createState() => _DayRectState();
}

class _DayRectState extends State<DayRect> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: widget.day == "Day 4"
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                height: 220,
                width: 340,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 65, 21, 225),
                      Color.fromARGB(255, 240, 54, 200)
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        widget.day,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 246, 245, 245),
                            fontSize: 25),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Rest Day",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 246, 245, 245),
                            fontSize: 25),
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                height: 220,
                width: 340,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 19, 46, 145),
                      Color.fromARGB(255, 102, 4, 109),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.green,
                ),
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: double.infinity,
                  ),
                  child: Wrap(
                    direction: Axis.horizontal,
                    runSpacing: 3,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 15, right: 10),
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          widget.day,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MuscleBtn(muscle: "Shoulder"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MuscleBtn(muscle: "Shoulder"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MuscleBtn(muscle: "Shoulder"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MuscleBtn(muscle: "Shoulder"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: MuscleBtn(muscle: "shounders"),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
