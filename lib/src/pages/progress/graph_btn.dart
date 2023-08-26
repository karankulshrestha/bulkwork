import 'package:flutter/material.dart';

class GraphButton extends StatelessWidget {
  final String title;
  final VoidCallback func;
  const GraphButton({super.key, required this.title, required this.func});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(70),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 25, 27, 139),
            Color.fromARGB(255, 139, 22, 132)
          ],
        ),
      ),
      child: Container(
        width: 300,
        child: SizedBox(
          width: 400,
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(70.0),
                ),
              ),
              minimumSize: MaterialStateProperty.all(Size(20, 100)),
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              // elevation: MaterialStateProperty.all(3),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: () {
              func();
            },
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                title,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
