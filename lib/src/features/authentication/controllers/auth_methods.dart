import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

        await _firestore.collection("users").doc(cred.user!.uid).set({
          "uid": cred.user!.uid,
          "email": email,
          "phoneNumber": phoneNumber
        });
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
