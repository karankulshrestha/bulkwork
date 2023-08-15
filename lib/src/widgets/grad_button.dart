import 'package:flutter/material.dart';

class GradButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const GradButton({super.key, required this.text, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 250,
        height: 60,
        child: Ink(
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 16, 21, 177),
              Color.fromARGB(255, 185, 12, 173)
            ]),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 3, 3, 3).withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: InkWell(
            onTap: onPressed,
            child: Container(
              width: 150,
              height: 50,
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    color: Colors.white),
              ),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ),
      ),
    );
  }
}
