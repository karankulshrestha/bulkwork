import 'package:bulkwork/src/models/full_gym.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FullGymExercise {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> registerExercise({
    required String week,
    required String day,
    required String ex1,
    required String ex2,
    String? ex3,
    String? ex4,
    String? ex5,
    required bool restday,
  }) async {
    String res = "Some error occurred in user details";

    try {
      if (ex1.isNotEmpty || ex2.isNotEmpty) {
        String uid = await _auth.currentUser!.uid;

        FullGymDays fullGymDays = FullGymDays(
            ex1: ex1, ex2: ex2, ex3: ex3, ex4: ex4, ex5: ex5, restday: restday);

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

  Future<FullGymDays?> getMusclesDetails(
      {required String week, required String day}) async {
    String uid = await _auth.currentUser!.uid;

    final muscleDataRef = await _firestore
        .collection("FullGymDays")
        .doc(uid)
        .collection(week)
        .doc(uid)
        .collection(day)
        .doc(uid);

    const source = Source.cache;

    final muscleData = await muscleDataRef.get(GetOptions(source: source));

    FullGymDays? data;

    if (muscleData.data() != null) {
      data = FullGymDays.fromSnap(muscleData.data()!);
    }

    print(data!.ex1);

    return data;
  }
}
