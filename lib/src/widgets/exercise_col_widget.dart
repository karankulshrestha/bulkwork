import 'package:flutter/material.dart';

class ExerciseColWidget extends StatelessWidget {
  final String exercise, reps, sets;
  const ExerciseColWidget(
      {super.key,
      required this.exercise,
      required this.reps,
      required this.sets});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 280,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 44, 38, 239),
              Color.fromARGB(255, 243, 36, 198)
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 23, 23, 23).withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 100,
              child: Text(
                exercise,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Text(
              sets,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              "X",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            Text(
              reps,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
