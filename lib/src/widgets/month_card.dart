import 'package:flutter/material.dart';

class MonthCard extends StatelessWidget {
  final String month;
  const MonthCard({super.key, required this.month});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color.fromARGB(255, 146, 30, 175),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 26, 50, 171).withOpacity(0.4),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            child: Text(
              month,
              style: TextStyle(
                color: Color.fromARGB(255, 242, 242, 245),
                fontWeight: FontWeight.w900,
                fontSize: 34,
              ),
            ),
            padding: const EdgeInsets.all(9),
          ),
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 222, 10, 211),
                    Color.fromARGB(255, 22, 10, 193)
                  ],
                ),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12))),
            child: Text(
              "Month",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            padding: const EdgeInsets.all(9),
          )
        ],
      ),
    );
  }
}
