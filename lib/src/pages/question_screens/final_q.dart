import 'package:bulkwork/src/pages/screens/home_screen.dart';
import 'package:bulkwork/src/widgets/grad_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gender.dart';

class FinalQScreen extends StatefulWidget {
  final String gender, fat, age, height, weight;
  const FinalQScreen(
      {super.key,
      required this.gender,
      required this.fat,
      required this.age,
      required this.height,
      required this.weight});

  @override
  State<FinalQScreen> createState() => _FinalQScreenState();
}

class _FinalQScreenState extends State<FinalQScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/finalq.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.14,
                    left: MediaQuery.of(context).size.width * 0.12),
                child: Text(
                  "Do you have access to full gym\n equipment or only dumbbells?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: GradButton(
                  text: "Full gym",
                  onPressed: () {
                    if (context.mounted) {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => HomeScreen(
                            gender: widget.gender,
                            fat: widget.fat,
                            age: widget.age,
                            height: widget.height,
                            mode: "Full gym",
                            weight: widget.weight,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 150),
                child: GradButton(
                  text: "Dumbbells only",
                  onPressed: () {
                    if (context.mounted) {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => HomeScreen(
                            gender: widget.gender,
                            fat: widget.fat,
                            age: widget.age,
                            height: widget.height,
                            mode: "Dumbbells only",
                            weight: widget.weight,
                          ),
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
