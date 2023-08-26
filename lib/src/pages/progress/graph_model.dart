import 'package:firebase_auth/firebase_auth.dart';

class ChartData {
  final DateTime? x;
  final double y;
  ChartData(this.x, this.y);

  Map<String, dynamic> toJson() => {"x": x, "y": y};
}
