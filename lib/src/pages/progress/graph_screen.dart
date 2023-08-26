import 'package:bulkwork/src/features/utils/utils.dart';
import 'package:bulkwork/src/pages/progress/chart_methods.dart';
import 'package:bulkwork/src/pages/progress/graph_btn.dart';
import 'package:bulkwork/src/pages/progress/line_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GraphScreen extends StatefulWidget {
  final String name;
  GraphScreen({super.key, required this.name});

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  @override
  void initState() {
    ChartPrefs().getChartData(name: widget.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 32, 79, 221),
                      Color.fromARGB(255, 236, 65, 211),
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
              child: Column(
                children: [
                  LineChartWidget(
                    name: widget.name,
                  ),
                ],
              ),
            )));
  }
}
