import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/welcome.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(top: 85),
              child: Center(
                child: Text(
                  "BULKWORK",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 33,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 175),
              child: Center(
                child: Text(
                  "The Power To Be Big",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 355),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Create customized workout \n routines according to your needs",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 650),
                child: Center(
                  child: TextButton(
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {},
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
