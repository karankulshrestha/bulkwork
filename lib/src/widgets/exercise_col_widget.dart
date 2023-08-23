import 'package:flutter/material.dart';

class ExerciseColWidget extends StatefulWidget {
  final bool isEnabled;
  const ExerciseColWidget({super.key, required this.isEnabled});

  @override
  State<ExerciseColWidget> createState() => _ExerciseColWidgetState();
}

class _ExerciseColWidgetState extends State<ExerciseColWidget> {
  bool _isEnable = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 50,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _isEnable = true;
              });
            },
            child: Container(
              width: 140,
              child: TextField(
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 254, 254),
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Shoulder press",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 254, 254),
                    fontSize: 18,
                  ),
                ),
                enabled: _isEnable,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _isEnable = true;
              });
            },
            child: Container(
              width: 40,
              child: TextField(
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 254, 254),
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "3",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 254, 254),
                    fontSize: 18,
                  ),
                ),
                enabled: _isEnable,
              ),
            ),
          ),
          Container(
            width: 40,
            child: Text(
              "X",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _isEnable = true;
              });
            },
            child: Container(
              width: 40,
              child: TextField(
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 254, 254),
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "12",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 254, 254),
                    fontSize: 18,
                  ),
                ),
                enabled: _isEnable,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.remove,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
