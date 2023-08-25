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

        await _firestore.collection("FullGymExDetails").add(
              fullGymExDetails.toJson(),
            );

        res = "success";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<List> getExercideDetails(
      {required String week, required String muscle}) async {
    final temp = {"exercise": "", "reps": "", "sets": ""};

    List exeObj = [];
    String uid = await _auth.currentUser!.uid;

    QuerySnapshot snap = await _firestore.collection("FullGymExDetails").get();

    FullGymDays? data;

    snap.docs.forEach(
      (document) {
        if (document["week"] == week &&
            document["muscle"] == muscle &&
            document["uid"] == uid) {
          temp.addAll({
            "exercise": document["ex"],
            "reps": document["reps"],
            "sets": document["sets"]
          });

          exeObj.add(document.data());

          // print(document.data());
          // exeObj.add(temp);
        }
      },
    );
    print("loda ${exeObj}");
    return exeObj;
  }
}
