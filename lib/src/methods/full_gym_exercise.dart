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

        var obj = await _firestore.collection("FullGymExDetails");

        FullGymExModel fullGymExDetails = FullGymExModel(
          ex: ex,
          reps: reps,
          sets: sets,
          muscle: muscle,
          week: week,
        );

        await obj.add(fullGymExDetails.toJson());

        res = "success";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<List> getExercideDetails(
      {required String week, required String muscle}) async {
    List exeObj = [];
    String uid = await _auth.currentUser!.uid;

    const source = Source.server;

    QuerySnapshot snap = await _firestore
        .collection("FullGymExDetails")
        .get(GetOptions(source: source));

    FullGymDays? data;

    snap.docs.forEach(
      (document) {
        if (document["week"] == week &&
            document["muscle"] == muscle &&
            document["uid"] == uid) {
          exeObj.add({
            "ex": document["ex"],
            "reps": document["reps"],
            "sets": document["sets"],
            "id": document.id
          });
        }
      },
    );
    print("loda ${exeObj}");
    return exeObj;
  }
}
