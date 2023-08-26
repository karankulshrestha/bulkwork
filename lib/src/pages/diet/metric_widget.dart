import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MetricWidget extends StatefulWidget {
  final String name;
  final int current, total;
  const MetricWidget(
      {super.key,
      required this.name,
      required this.current,
      required this.total});

  @override
  State<MetricWidget> createState() => _MetricWidgetState();
}

class _MetricWidgetState extends State<MetricWidget> {
  late double perce;

  @override
  void initState() {
    super.initState();
    perce = widget.current / widget.total;
    print("maa ${perce}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 120,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 47, 47, 205),
                          Color.fromARGB(255, 216, 63, 221),
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                    borderRadius: BorderRadius.circular(20)),
                child: new CircularPercentIndicator(
                  radius: 40.0,
                  lineWidth: 8.0,
                  percent: perce,
                  center: new Text(
                    "${perce * 100}%",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 255, 254, 254),
                        fontWeight: FontWeight.w900),
                  ),
                  progressColor: Color.fromARGB(255, 23, 241, 30),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${widget.current}",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 82, 82, 82),
                        fontSize: 24,
                        fontWeight: FontWeight.w900),
                  ),
                  widget.name == "Calories"
                      ? Text("Calories Out of")
                      : Text("Protein Out of"),
                  Text(
                    "${widget.total}",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 82, 82, 82),
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              )
            ],
          ),
          Container(
            width: 70,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 47, 47, 205),
                    Color.fromARGB(255, 216, 63, 221),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
