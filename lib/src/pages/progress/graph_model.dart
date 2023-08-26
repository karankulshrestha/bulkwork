import 'package:collection/collection.dart';

class MetricPoint {
  final double x;
  final double y;
  MetricPoint({required this.x, required this.y});

  Map<String, dynamic> toJson() =>
      {"x": x, "y": y, "updatedAt": DateTime.now()};
}

List<MetricPoint> get MetricPoints {
  final data = <double>[
    3,
    4,
    5,
    4,
    2,
    3,
    5,
    6,
    1,
    3,
    4,
    5,
    6,
    3,
    4,
    5,
    6,
    4,
    1,
    3,
    4,
    5,
    6
  ];
  return data
      .mapIndexed((index, element) =>
          MetricPoint(x: index.toDouble(), y: element.toDouble()))
      .toList();
}
