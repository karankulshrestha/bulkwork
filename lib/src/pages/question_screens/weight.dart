import 'package:bulkwork/src/pages/question_screens/final_q.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/grad_button.dart';
import 'gender.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({super.key});

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/weight.png"), fit: BoxFit.cover),
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
                        "What is your weight?",
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
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        decoration: InputDecoration(
                          counterStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Enter weight (in kg)",
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
                                    builder: (context) => FinalQScreen()));
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
