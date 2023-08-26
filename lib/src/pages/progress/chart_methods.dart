import 'package:bulkwork/src/pages/progress/graph_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bulkwork/src/models/user_pref.dart';
import 'package:intl/intl.dart';

class ChartPrefs {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> registerChartData(
      {required DateTime? x, required double y, required String name}) async {
    String res = "Some error occurred in user details";

    try {
      if (name.isNotEmpty) {
        String uid = await _auth.currentUser!.uid;

        ChartData cdata = ChartData(x, y);

        await _firestore
            .collection("charts")
            .doc(uid)
            .collection(name)
            .add(cdata.toJson());
        res = "success";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<List> getChartData({required String name}) async {
    String uid = await _auth.currentUser!.uid;

    QuerySnapshot snap =
        await _firestore.collection("charts").doc(uid).collection(name).get();

    List data = [];

    snap.docs.forEach((element) {
      if (element.exists) {
        data.add({"x": element["x"].toDate(), "y": element["y"]});
      }
    });

    print(data);

    return data;
  }
}
