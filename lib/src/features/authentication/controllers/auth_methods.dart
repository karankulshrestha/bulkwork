import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bulkwork/src/features/authentication/models/user.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // sign up the user
  Future<String> signUpUser(
      {required String email,
      required String password,
      required String phoneNumber}) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty || phoneNumber.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        model.User user = model.User(
            email: email, phoneNumber: phoneNumber, uid: cred.user!.uid);

        await _firestore
            .collection("users")
            .doc(cred.user!.uid)
            .set(user.toJson());
        res = "success";
      } else {
        res = "please enter all fields";
      }
    } catch (e) {
      return e.toString();
    }
    return res;
  }
}
