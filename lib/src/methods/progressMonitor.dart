import 'package:bulkwork/src/models/complete_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class completitionMusclesDetails {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> setComplete({
    required String muscle,
    required bool status,
    required String week,
    required String day,
  }) async {
    String res = "Some error occurred in user details";

    try {
      if (muscle.isNotEmpty) {
        String uid = await _auth.currentUser!.uid;

        var obj = await _firestore.collection("Completion").doc(uid);

        CompletingModel fullGymExDetails = CompletingModel(
          week: week,
          day: day,
          muscle: muscle,
          completed: status,
        );

        await obj
            .collection(muscle + week + " " + day)
            .doc(muscle + week + " " + day)
            .set(fullGymExDetails.toJson());

        res = "success";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<bool> getCompleteStatus(
      {required String muscle,
      required String week,
      required String day}) async {
    String uid = await _auth.currentUser!.uid;

    QuerySnapshot snap = await _firestore
        .collection("Completion")
        .doc(uid)
        .collection(muscle + week + " " + day)
        .get();

    bool status = false;

    snap.docs.forEach((element) {
      if (element.exists) {
        if (element["week"] == week && element["day"] == day) {
          print(element["status"]);
          status = element["status"];
        }
      }
    });

    return status;
  }

  Future<bool> getTotalComplete(
      {required String muscle,
      required String week,
      required String day}) async {
    String uid = await _auth.currentUser!.uid;

    QuerySnapshot snap = await _firestore
        .collection("Completion")
        .doc(uid)
        .collection(muscle)
        .get();

    bool status = false;

    snap.docs.forEach((element) {
      if (element.exists) {
        if (element["week"] == week && element["day"] == day) {
          print(element["status"]);
          status = element["status"];
        }
      }
    });

    return status;
  }
}
