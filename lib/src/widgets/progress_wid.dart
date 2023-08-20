import 'package:bulkwork/src/widgets/grad_button.dart';
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
            child: GradButton(text: label, onPressed: onPressed),
          ),
        ),
      ),
    );
  }
}
