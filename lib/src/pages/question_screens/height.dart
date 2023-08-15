import 'package:bulkwork/src/pages/question_screens/gender.dart';
import 'package:bulkwork/src/pages/question_screens/weight.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/grad_button.dart';

class HeightScreen extends StatefulWidget {
  final String gender, fat, age;
  const HeightScreen(
      {super.key, required this.gender, required this.fat, required this.age});

  @override
  State<HeightScreen> createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController heightController = new TextEditingController();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/height.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 140,
                    ),
                    Container(
                      child: Text(
                        "What is your height?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: TextField(
                        controller: heightController,
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        decoration: InputDecoration(
                          counterStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Enter height (in cm)",
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      child: GradButton(
                        text: "Continue",
                        onPressed: () {
                          if (context.mounted) {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => WeightScreen(
                                    gender: widget.gender,
                                    fat: widget.fat,
                                    age: widget.age,
                                    height: heightController.text),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
