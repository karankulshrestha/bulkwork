import 'package:bulkwork/src/models/full_gym.dart';
import 'package:bulkwork/src/models/full_gym_ex_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FullGymExerciseDetails {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> registerExercise({
    required String week,
    required String ex,
    required String muscle,
    String? reps,
    String? sets,
  }) async {
    String res = "Some error occurred in user details";

    try {
      if (ex.isNotEmpty) {
        String uid = await _auth.currentUser!.uid;

        FullGymExModel fullGymExDetails = FullGymExModel(
            ex: ex, reps: reps, sets: sets, muscle: muscle, week: week);

        await _firestore
            .collection("FullGymExDetails")
            .doc(uid)
            .collection(week)
            .add(fullGymExDetails.toJson());
        res = "success";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<FullGymDays?> getMusclesDetails(
      {required String week, required String day, required String exer}) async {
    String uid = await _auth.currentUser!.uid;

    final muscleDataRef = await _firestore
        .collection("FullGymExDetails")
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
