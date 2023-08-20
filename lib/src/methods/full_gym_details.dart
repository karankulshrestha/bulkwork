import 'package:bulkwork/src/models/full_gym.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FullGymExercise {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> registerExercise({
    required String week,
    required String day,
    required String ex1,
    required String ex2,
    String? ex3,
  }) async {
    String res = "Some error occurred in user details";

    try {
      if (ex1.isNotEmpty || ex2.isNotEmpty) {
        String uid = await _auth.currentUser!.uid;

        FullGymDays fullGymDays = FullGymDays(ex1: ex1, ex2: ex2, ex3: ex3);

        await _firestore
            .collection("FullGymDays")
            .doc(uid)
            .collection(week)
            .doc(uid)
            .collection(day)
            .doc(uid)
            .set(fullGymDays.toJson());
        res = "success";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
