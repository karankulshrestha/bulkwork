import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProgressWid extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const ProgressWid({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: InkWell(
          onTap: onPressed,
          child: SizedBox(
            child: new LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 80,
              animation: true,
              lineHeight: 60.0,
              animationDuration: 2500,
              percent: 0.8,
              center: Text(
                label,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              barRadius: const Radius.circular(20),
              progressColor: Color.fromARGB(255, 115, 4, 128),
            ),
          ),
        ),
      ),
    );
  }
}
