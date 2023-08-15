import 'package:bulkwork/src/features/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  final String gender, fat, age, height, mode, weight;
  const HomeScreen(
      {super.key,
      required this.gender,
      required this.fat,
      required this.age,
      required this.height,
      required this.weight,
      required this.mode});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  String name = ' ';

  save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("fat", widget.fat);
    prefs.setString("gender", widget.gender);
    prefs.setString("height", widget.height);
    prefs.setString("weight", widget.weight);
    prefs.setString("mode", widget.mode);
    prefs.setString("age", widget.age);
  }

  @override
  void initState() {
    super.initState();
    save();
  }

  readSaved() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("fat")!;
    });
    print(name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 100),
              child: ElevatedButton(
                child: const Text('saved'),
                onPressed: () {
                  save();
                },
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 100),
              child: ElevatedButton(
                child: const Text('Read'),
                onPressed: () {
                  readSaved();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
