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
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          height: 60,
          width: 310,
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
          child: Expanded(
            child: new ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
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
                widget.day == "Day 4"
                    ? Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        child: Text(
                          "Rest Day",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Color.fromARGB(255, 215, 209, 209),
                              fontSize: 25),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MuscleBtn(muscle: "Chest"),
                      ),
                widget.day == "Day 4"
                    ? Text("")
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MuscleBtn(muscle: "Shoulder"),
                      ),
                widget.day == "Day 4"
                    ? Text("")
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MuscleBtn(muscle: "Chest"),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
