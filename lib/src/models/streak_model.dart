import 'package:firebase_auth/firebase_auth.dart';

class CompletingModel {
  bool? currentStreak;
  String? totalStreak;
  String uid = FirebaseAuth.instance.currentUser!.uid;

  CompletingModel({required this.currentStreak, required this.totalStreak});

  Map<String, dynamic> toJson() => {
        "currentStreak": currentStreak,
        "totalStreak": totalStreak,
        "uid": uid,
        "updatedAt": DateTime.now()
      };
}
