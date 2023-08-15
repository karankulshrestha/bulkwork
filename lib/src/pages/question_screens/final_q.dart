import 'package:bulkwork/src/widgets/grad_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gender.dart';

class FinalQScreen extends StatefulWidget {
  const FinalQScreen({super.key});

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
                  onPressed: () {},
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 150),
                child: GradButton(
                  text: "Dumbbells only",
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
