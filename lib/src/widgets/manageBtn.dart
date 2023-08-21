import 'package:flutter/material.dart';

class ManageBtn extends StatelessWidget {
  final String muscle;
  const ManageBtn({super.key, required this.muscle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 65, 21, 225),
            Color.fromARGB(255, 240, 54, 200)
          ],
        ),
      ),
      child: Container(
        width: 250,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(Size(20, 50)),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                // elevation: MaterialStateProperty.all(3),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  muscle,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
