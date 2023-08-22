import 'package:cloud_firestore/cloud_firestore.dart';

class FullGymDays {
  String? ex1;
  String? ex2;
  String? ex3;
  String? ex4;
  String? ex5;
  bool? restday;

  FullGymDays({
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
        "restday": restday,
        "updatedAt": DateTime.now()
      };
}
