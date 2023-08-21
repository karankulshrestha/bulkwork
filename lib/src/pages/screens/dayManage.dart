import 'package:bulkwork/src/models/full_gym.dart';
import 'package:bulkwork/src/widgets/manageBtn.dart';
import 'package:bulkwork/src/widgets/muscle_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class DayManager extends StatefulWidget {
  final String day, week;
  final FullGymDays fullGymDays;
  const DayManager(
      {super.key,
      required this.fullGymDays,
      required this.day,
      required this.week});

  @override
  State<DayManager> createState() => _DayManagerState();
}

class _DayManagerState extends State<DayManager> {
  List<String> muscles = [];

  @override
  void initState() {
    super.initState();
    saveDayDetails();
  }

  saveDayDetails() {
    muscles.addAll([
      widget.fullGymDays.ex1!,
      widget.fullGymDays.ex2!,
    ]);

    if (widget.fullGymDays.ex3 != null) {
      muscles.add(widget.fullGymDays.ex3!);
    }

    if (widget.fullGymDays.ex4 != null) {
      muscles.add(widget.fullGymDays.ex4!);
    }

    if (widget.fullGymDays.ex5 != null) {
      muscles.add(widget.fullGymDays.ex5!);
    }

    print("day manage: ${muscles.length}");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 33, 26, 133),
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
                color: Color.fromARGB(255, 249, 249, 249)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("Manage  |  ${widget.week}  |  ${widget.day}"),
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.22),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/daymanage.png"),
                    fit: BoxFit.cover),
              ),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          ...muscles.map(
                            (e) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: ManageBtn(muscle: e),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 135, 14, 159),
                                    borderRadius: BorderRadius.circular(90),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      muscles.remove(e);
                                    },
                                    icon: Icon(Icons.delete),
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 240, 30, 156),
                              elevation: 12.0,
                              textStyle: const TextStyle(color: Colors.white)),
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                              elevation: 12.0,
                              textStyle: const TextStyle(color: Colors.white)),
                          child: const Text('Add'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
