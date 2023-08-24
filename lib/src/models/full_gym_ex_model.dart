class FullGymExModel {
  String? ex;
  String? muscle;
  String? reps;
  String? sets;
  String? week;

  FullGymExModel(
      {required this.ex,
      required this.reps,
      required this.sets,
      required this.week,
      required this.muscle});

  Map<String, dynamic> toJson() => {
        "ex": ex,
        "muscle": muscle,
        "reps": reps,
        "sets": sets,
        "week": week,
        "updatedAt": DateTime.now()
      };
}
