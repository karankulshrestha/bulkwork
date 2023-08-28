import 'package:firebase_auth/firebase_auth.dart';

class HealthModel {
  int? current;
  String? metric;
  String uid = FirebaseAuth.instance.currentUser!.uid;

  HealthModel({required this.current, required this.metric});

  Map<String, dynamic> toJson() =>
      {"${metric}": current, "updatedAt": DateTime.now()};
}
