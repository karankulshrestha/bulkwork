import 'package:flutter/material.dart';

class ExerciseBtn extends StatelessWidget {
  final String muscle;
  final VoidCallback Btn;
  const ExerciseBtn({super.key, required this.muscle, required this.Btn});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.0,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 51, 46, 177),
            Color.fromARGB(255, 210, 48, 175)
          ],
        ),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          minimumSize: MaterialStateProperty.all(Size(20, 50)),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          // elevation: MaterialStateProperty.all(3),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: Btn,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          child: Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            muscle,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
