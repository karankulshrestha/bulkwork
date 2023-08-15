import 'package:bulkwork/src/features/utils/utils.dart';
import 'package:bulkwork/src/pages/question_screens/age.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/grad_button.dart';

class Gender extends StatefulWidget {
  final String fat;
  const Gender({super.key, required this.fat});

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/gender.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.14,
                    left: MediaQuery.of(context).size.width * 0.19),
                child: Text(
                  "What is your gender?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: GradButton(
                  text: "MALE",
                  onPressed: () {
                    if (context.mounted) {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) =>
                              AgeScreen(fat: widget.fat, gender: "MALE"),
                        ),
                      );
                    }
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 150),
                child: GradButton(
                  text: "FEMALE",
                  onPressed: () {
                    if (context.mounted) {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) =>
                              AgeScreen(fat: widget.fat, gender: "FEMALE"),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
