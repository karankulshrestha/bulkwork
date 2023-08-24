import 'package:firebase_auth/firebase_auth.dart';

class FullGymExModel {
  String? ex;
  String? muscle;
  String? reps;
  String? sets;
  String? week;
  String uid = FirebaseAuth.instance.currentUser!.uid;

  FullGymExModel(
      {required this.ex,
      required this.reps,
      required this.sets,
      required this.week,
      required this.muscle});

  Map<String, dynamic> toJson() => {
        "ex": ex,
        "muscle": muscle,
        "reps": reps,
        "sets": sets,
        "week": week,
        "uid": uid,
        "updatedAt": DateTime.now()
      };
}
