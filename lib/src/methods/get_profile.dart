import 'package:bulkwork/src/methods/user_details.dart';
import 'package:bulkwork/src/models/full_gym.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List> getUserDetails() async {
    String uid = await _auth.currentUser!.uid;
    List User = [];

    const source = Source.cache;

    QuerySnapshot snap = await _firestore.collection("userDetails").get(
          GetOptions(source: source),
        );

    UserPreference? data;

    snap.docs.forEach(
      (document) {
        if (document["uid"] == uid) {
          User.add({
            "age": document["age"],
            "fat": document["fat"],
            "weight": document["weight"],
            "height": document["height"],
          });
        }
      },
    );

    print(User);

    return User;
  }
}
