import 'package:cloud_firestore/cloud_firestore.dart';

class FullGymDays {
  final String? ex1;
  final String? ex2;
  final String? ex3;

  const FullGymDays({required this.ex1, required this.ex2, this.ex3});

  static FullGymDays fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return FullGymDays(
        ex1: snapshot["ex1"], ex2: snapshot["ex2"], ex3: snapshot["ex3"]);
  }

  Map<String, dynamic> toJson() => {"ex1": ex1, "ex2": ex2, "ex3": ex3};
}
