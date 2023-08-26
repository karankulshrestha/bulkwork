import 'package:bulkwork/src/pages/progress/graph_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({super.key});

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ChartData> chartData = [
      ChartData(DateTime(2023, 1, 14), 6),
      ChartData(DateTime(2023, 2, 13), 11),
      ChartData(DateTime(2023, 2, 12), 9),
      ChartData(DateTime(2023, 4, 23), 14),
    ];

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
        child: Container(
          height: 550,
          child: SfCartesianChart(
            plotAreaBorderColor: Colors.white,
            title: ChartTitle(
              text: "Squat (PR)",
              textStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
              maximumLabels: 100,
              autoScrollingDelta: 5,
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
              labelFormat: '{value}kg',
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
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final DateTime x;
  final double y;
}
