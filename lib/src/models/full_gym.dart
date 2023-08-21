import 'package:cloud_firestore/cloud_firestore.dart';

class FullGymDays {
  final String? ex1;
  final String? ex2;
  final String? ex3;
  final String? ex4;
  final String? ex5;
  final bool? restday;

  const FullGymDays({
    required this.ex1,
    required this.ex2,
    required this.restday,
    this.ex3,
    this.ex4,
    this.ex5,
  });

  static FullGymDays fromSnap(Map<String, dynamic> snapshot) {
    return FullGymDays(
        ex1: snapshot["ex1"],
        ex2: snapshot["ex2"],
        ex3: snapshot["ex3"],
        ex4: snapshot["ex4"],
        ex5: snapshot["ex5"],
        restday: snapshot["restday"]);
  }

  Map<String, dynamic> toJson() => {
        "ex1": ex1,
        "ex2": ex2,
        "ex3": ex3,
        "ex4": ex4,
        "ex5": ex5,
        "restday": restday
      };
}
