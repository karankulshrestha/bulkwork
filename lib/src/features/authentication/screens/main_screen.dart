import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/main.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.56),
                child: Center(
                  child: Text(
                    "Right before we create the perfect workout \n routine for you, we need to ask you some \n questions",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.8),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint('Hi there');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            Color.fromARGB(255, 16, 21, 177),
                            Color.fromARGB(255, 185, 12, 173)
                          ]),
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        width: 150,
                        height: 50,
                        alignment: Alignment.center,
                        child: const Text(
                          'I\'m in',
                          style: TextStyle(
                              fontSize: 24, fontStyle: FontStyle.normal),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Color.fromARGB(255, 247, 247, 247),
                            ),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
