import 'package:bulkwork/src/features/utils/utils.dart';
import 'package:bulkwork/src/pages/progress/chart_methods.dart';
import 'package:bulkwork/src/pages/progress/graph_btn.dart';
import 'package:bulkwork/src/pages/progress/graph_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:bulkwork/src/pages/progress/graph_model.dart';

class LineChartWidget extends StatefulWidget {
  final String name;
  const LineChartWidget({
    super.key,
    required this.name,
  });

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  late TooltipBehavior _tooltipBehavior;
  late List<ChartData> chartData;
  TextEditingController _exController = new TextEditingController();
  TextEditingController dateController = new TextEditingController();
  DateTime? pickedDate;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    chartData = [];
    super.initState();
    getData();
  }

  getData() async {
    List data = await ChartPrefs().getChartData(name: widget.name);
    List<ChartData> finalData = [];
    for (int i = 0; i < data.length; i++) {
      ChartData d = ChartData(data[i]["x"], data[i]["y"]);
      finalData.add(d);
    }
    setState(() {
      chartData.addAll(finalData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Center(
        child: Column(
          children: [
            Container(
              height: 550,
              child: SfCartesianChart(
                plotAreaBorderColor: Colors.white,
                title: ChartTitle(
                  text: widget.name,
                  textStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                legend: Legend(
                  isVisible: true,
                  textStyle: TextStyle(color: Colors.white),
                ),
                tooltipBehavior: _tooltipBehavior,
                enableAxisAnimation: true,
                primaryXAxis: DateTimeAxis(
                  // dateFormat: DateFormat.yMd(),
                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                  intervalType: DateTimeIntervalType.months,
                  interval: 1,
                  // maximumLabels: 100,
                  autoScrollingDelta: 1,
                  // minimum: DateTime(2023, 2, 1),
                  // maximum: DateTime(2023, 2, 20),
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 253, 253, 253),
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  majorGridLines: MajorGridLines(width: 0.2),
                  majorTickLines: MajorTickLines(width: 0.2),
                ),
                primaryYAxis: NumericAxis(
                  majorGridLines: MajorGridLines(width: 0.2),
                  majorTickLines: MajorTickLines(width: 0.2),
                  labelFormat: '{value}' +
                      (widget.name == "Arm (Measurement)" ||
                              widget.name == "Chest (Measurement)" ||
                              widget.name == "Waist (Measurement)"
                          ? 'cm'
                          : widget.name == "Body fat percentage"
                              ? '%'
                              : 'kg'),
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 253, 253, 253),
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                zoomPanBehavior: ZoomPanBehavior(
                  enablePanning: true,
                ),
                series: <ChartSeries>[
                  // Renders line chart
                  LineSeries<ChartData, DateTime>(
                      color: const Color.fromARGB(255, 245, 244, 244),
                      name: "Weight",
                      dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                        useSeriesColor: true,
                      ),
                      markerSettings: MarkerSettings(isVisible: true),
                      enableTooltip: true,
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y)
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GraphButton(
                title: "Add New Point",
                func: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        scrollable: true,
                        title: Text("Add the Metric"),
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  controller: _exController,
                                  decoration: InputDecoration(
                                    labelText: 'Metric',
                                  ),
                                ),
                                TextField(
                                  controller: dateController,
                                  decoration: const InputDecoration(
                                      icon: Icon(Icons.calendar_today),
                                      labelText: "Enter Date"),
                                  readOnly: true,
                                  onTap: () async {
                                    pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2101));

                                    String formattedDate =
                                        DateFormat('yyyy-MM-dd')
                                            .format(pickedDate!);
                                    dateController.text = formattedDate;
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                            child: Text("Submit"),
                            onPressed: () => {
                              ChartPrefs().registerChartData(
                                  x: pickedDate,
                                  y: double.parse(_exController.text),
                                  name: widget.name),
                              setState(() {
                                ChartData cd = ChartData(pickedDate,
                                    double.parse(_exController.text));
                                chartData = [...chartData, cd];
                              }),
                              showSnackBar(context, "added successfully"),
                            },
                          ),
                        ],
                      );
                    },
                  );
                  getData();
                })
          ],
        ),
      ),
    );
  }
}
