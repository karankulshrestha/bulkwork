import 'package:cloud_firestore/cloud_firestore.dart';

class UserPrefs {
  final String fat;
  final String gender;
  final String age;
  final String height;
  final String weight;
  final String mode;
  final String uid;

  const UserPrefs(
      {required this.fat,
      required this.gender,
      required this.age,
      required this.height,
      required this.weight,
      required this.mode,
      required this.uid});

  static UserPrefs fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserPrefs(
      fat: snapshot["fat"],
      gender: snapshot["gender"],
      age: snapshot["age"],
      height: snapshot["height"],
      weight: snapshot["weight"],
      mode: snapshot["mode"],
      uid: snapshot["uid"],
    );
  }

  Map<String, dynamic> toJson() => {
        "fat": fat,
        "gender": gender,
        "age": age,
        "height": height,
        "weight": weight,
        "mode": mode,
        "uid": uid
      };
}
