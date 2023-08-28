import 'package:bulkwork/src/features/utils/utils.dart';
import 'package:bulkwork/src/methods/reset_full_gym_days.dart';
import 'package:bulkwork/src/methods/reset_full_gym_exercise.dart';
import 'package:bulkwork/src/methods/user_details.dart';
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
  void saveData(String mode) async {
    String res = await UserPreference().registerUserDetails(
      fat: widget.fat,
      gender: widget.gender,
      age: widget.age,
      height: widget.height,
      weight: widget.weight,
      mode: mode,
    );

    if (res == "success") {
      showSnackBar(context, "data saved successfully");
    } else {
      showSnackBar(context, "data not saved successfully");
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isLoaded = false;
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
                  // "Do you have access to full gym\n equipment or only dumbbells?",
                  "Do you have access to full gym\n equipment?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              isLoaded
                  // ignore: dead_code
                  ? CircularProgressIndicator(
                      color: Colors.purple,
                    )
                  : Container(
                      child: GradButton(
                        text: "Full gym",
                        onPressed: () {
                          if (context.mounted) {
                            setState(() {
                              isLoaded = true;
                            });
                            saveData("Full gym");
                            resetFullGymExercise();
                            ResetFullGymDays();
                            setState(() {
                              isLoaded = false;
                            });
                            Navigator.pushAndRemoveUntil(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                                (Route<dynamic> route) => false);
                          }
                        },
                      ),
                    ),
              // Container(
              //   padding: EdgeInsets.only(top: 150),
              //   child: GradButton(
              //     text: "Dumbbells only",
              //     onPressed: () {
              //       saveData("Dumbbells only");
              //       if (context.mounted) {
              //         Navigator.pushAndRemoveUntil(
              //             context,
              //             CupertinoPageRoute(
              //               builder: (context) => HomeScreen(),
              //             ),
              //             (Route<dynamic> route) => false);
              //       }
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
