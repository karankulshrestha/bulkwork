import 'package:riverpod/riverpod.dart';

class FullGymMuscleList extends Notifier<List<String>> {
  @override
  List<String> build() {
    return [];
  }

  void removeMuscle(int index) {
    state.removeAt(index);
    state = [...state];
  }
}

var strNotifierProvider =
    NotifierProvider<FullGymMuscleList, List<String>>(FullGymMuscleList.new);
