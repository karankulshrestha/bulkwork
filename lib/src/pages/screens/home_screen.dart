import 'package:bulkwork/src/features/utils/utils.dart';
import 'package:bulkwork/src/methods/user_details.dart';
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
  void initState() {
    super.initState();
    saveData();
  }

  void saveData() async {
    String res = await UserPreference().registerUserDetails(
        fat: widget.fat,
        gender: widget.gender,
        age: widget.age,
        height: widget.height,
        weight: widget.weight,
        mode: widget.mode);

    if (res == "success") {
      showSnackBar(context, "data saved successfully");
    } else {
      showSnackBar(context, "data not saved successfully");
    }
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
                onPressed: () {},
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 100),
              child: ElevatedButton(
                child: const Text('Read'),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
