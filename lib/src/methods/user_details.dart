import 'package:bulkwork/src/pages/diet/metric_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bulkwork/src/models/user_pref.dart';

class UserPreference {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> registerUserDetails(
      {required String fat,
      required String gender,
      required String age,
      required String height,
      required String weight,
      required String mode}) async {
    String res = "Some error occurred in user details";

    try {
      if (fat.isNotEmpty ||
          gender.isNotEmpty ||
          age.isNotEmpty ||
          height.isNotEmpty ||
          weight.isNotEmpty ||
          mode.isNotEmpty) {
        String uid = await _auth.currentUser!.uid;

        UserPrefs prefs = UserPrefs(
            fat: fat,
            gender: gender,
            age: age,
            height: height,
            weight: weight,
            mode: mode,
            uid: uid);

        await _firestore.collection("userDetails").doc(uid).set(prefs.toJson());
        res = "success";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> updateMetric(
      {required int current, required String metric}) async {
    String res = "Some error occurred in user details";

    try {
      if (metric.isNotEmpty) {
        String uid = await _auth.currentUser!.uid;
        HealthModel model = HealthModel(metric: metric, current: current);
        await FirebaseFirestore.instance
            .collection("HealthMetric")
            .doc(uid)
            .set(model.toJson());
        res = "success";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
