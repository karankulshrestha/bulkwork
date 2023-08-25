import 'package:firebase_auth/firebase_auth.dart';

class CompletingModel {
  bool? completed;
  String? muscle;
  String? week;
  String? day;
  String uid = FirebaseAuth.instance.currentUser!.uid;

  CompletingModel(
      {required this.completed,
      required this.muscle,
      required this.week,
      required this.day});

  Map<String, dynamic> toJson() => {
        "status": completed,
        "muscle": muscle,
        "uid": uid,
        "week": week,
        "day": day,
        "updatedAt": DateTime.now()
      };
}
