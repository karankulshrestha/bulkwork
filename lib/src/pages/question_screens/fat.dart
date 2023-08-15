import 'package:bulkwork/src/pages/question_screens/gender.dart';
import 'package:bulkwork/src/widgets/grad_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FatPage extends StatefulWidget {
  const FatPage({super.key});

  @override
  State<FatPage> createState() => _FatPageState();
}

class _FatPageState extends State<FatPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/fat.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.14,
                    left: MediaQuery.of(context).size.width * 0.13),
                child: Text(
                  "What is your estimated body \n fat percentage?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: GradButton(
                  text: "Greater than 15%",
                  onPressed: () {
                    if (context.mounted) {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => Gender(fat: 'Greater than 15%'),
                        ),
                      );
                    }
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 150),
                child: GradButton(
                  text: "Lesser than 15%",
                  onPressed: () {
                    if (context.mounted) {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => Gender(fat: 'Lesser than 15%'),
                        ),
                      );
                    }
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 300),
                child: GradButton(
                    text: "I don't know",
                    onPressed: () {
                      if (context.mounted) {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => Gender(fat: 'I don\'t know'),
                          ),
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
