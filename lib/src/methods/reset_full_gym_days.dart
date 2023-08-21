import 'package:bulkwork/src/methods/full_gym_details.dart';

String res = "";

void ResetFullGymDays() async {
  // week 1
  res = await FullGymExercise().registerExercise(
      week: "Week 1",
      day: 'Day 1',
      ex1: "Chest",
      ex2: "Shoulders",
      ex3: "Triceps",
      restday: false);
  res = await FullGymExercise().registerExercise(
      week: "Week 1", day: 'Day 2', ex1: "Legs", ex2: "Abs", restday: false);
  res = await FullGymExercise().registerExercise(
      week: "Week 1", day: 'Day 3', ex1: "Back", ex2: "Biceps", restday: false);

  res = await FullGymExercise().registerExercise(
      week: "Week 1", day: 'Day 4', ex1: "Back", ex2: "Biceps", restday: true);

  res = await FullGymExercise().registerExercise(
      week: "Week 1",
      day: 'Day 5',
      ex1: "Chest",
      ex2: "Shoulders",
      ex3: "Triceps",
      restday: false);
  res = await FullGymExercise().registerExercise(
      week: "Week 1", day: 'Day 6', ex1: "Legs", ex2: "Abs", restday: false);
  res = await FullGymExercise().registerExercise(
      week: "Week 1", day: 'Day 7', ex1: "Back", ex2: "Biceps", restday: false);

  // week 2

  res = await FullGymExercise().registerExercise(
      week: "Week 2",
      day: 'Day 1',
      ex1: "Chest",
      ex2: "Shoulders",
      ex3: "Triceps",
      restday: false);

  res = await FullGymExercise().registerExercise(
      week: "Week 2", day: 'Day 2', ex1: "Legs", ex2: "Abs", restday: false);

  res = await FullGymExercise().registerExercise(
      week: "Week 2", day: 'Day 3', ex1: "Back", ex2: "Biceps", restday: false);

  res = await FullGymExercise().registerExercise(
      week: "Week 2", day: 'Day 4', ex1: "Back", ex2: "Biceps", restday: true);

  res = await FullGymExercise().registerExercise(
      week: "Week 2",
      day: 'Day 5',
      ex1: "Chest",
      ex2: "Shoulders",
      ex3: "Triceps",
      restday: false);

  res = await FullGymExercise().registerExercise(
      week: "Week 2", day: 'Day 6', ex1: "Legs", ex2: "Abs", restday: false);
  res = await FullGymExercise().registerExercise(
      week: "Week 2", day: 'Day 7', ex1: "Back", ex2: "Biceps", restday: false);

  // week 3
  res = await FullGymExercise().registerExercise(
      week: "Week 3",
      day: 'Day 1',
      ex1: "Chest",
      ex2: "Shoulders",
      ex3: "Triceps",
      restday: false);

  res = await FullGymExercise().registerExercise(
      week: "Week 3", day: 'Day 2', ex1: "Legs", ex2: "Abs", restday: false);

  res = await FullGymExercise().registerExercise(
      week: "Week 3", day: 'Day 3', ex1: "Back", ex2: "Biceps", restday: false);

  res = await FullGymExercise().registerExercise(
      week: "Week 3", day: 'Day 4', ex1: "Back", ex2: "Biceps", restday: true);

  res = await FullGymExercise().registerExercise(
      week: "Week 3",
      day: 'Day 5',
      ex1: "Chest",
      ex2: "Shoulders",
      ex3: "Triceps",
      restday: false);

  res = await FullGymExercise().registerExercise(
      week: "Week 3", day: 'Day 6', ex1: "Legs", ex2: "Abs", restday: false);

  res = await FullGymExercise().registerExercise(
      week: "Week 3", day: 'Day 7', ex1: "Back", ex2: "Biceps", restday: false);

  // week 4

  res = await FullGymExercise().registerExercise(
      week: "Week 4",
      day: 'Day 1',
      ex1: "Chest",
      ex2: "Shoulders",
      ex3: "Triceps",
      restday: false);

  res = await FullGymExercise().registerExercise(
      week: "Week 4", day: 'Day 2', ex1: "Legs", ex2: "Abs", restday: false);

  res = await FullGymExercise().registerExercise(
      week: "Week 4", day: 'Day 3', ex1: "Back", ex2: "Biceps", restday: false);

  res = await FullGymExercise().registerExercise(
      week: "Week 4", day: 'Day 4', ex1: "Back", ex2: "Biceps", restday: true);

  res = await FullGymExercise().registerExercise(
      week: "Week 4",
      day: 'Day 5',
      ex1: "Chest",
      ex2: "Shoulders",
      ex3: "Triceps",
      restday: false);

  res = await FullGymExercise().registerExercise(
      week: "Week 4", day: 'Day 6', ex1: "Legs", ex2: "Abs", restday: false);

  res = await FullGymExercise().registerExercise(
      week: "Week 4", day: 'Day 7', ex1: "Back", ex2: "Biceps", restday: false);
}
