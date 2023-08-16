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
      // padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.26),
      child: Center(
        child: Container(
          height: 55,
          width: 350,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 19, 46, 145),
                Color.fromARGB(255, 219, 19, 230),
                Color.fromARGB(255, 102, 4, 109),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(30),
            color: Colors.green,
          ),
          child: Row(),
        ),
      ),
    );
  }
}
