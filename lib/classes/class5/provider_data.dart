import 'package:flutter_riverpod/legacy.dart';

final personSNPod = StateNotifierProvider<PersonModel, String>((ref) {
  return PersonModel();
});

class PersonModel extends StateNotifier<String> {
  PersonModel() : super(""); // initial state

  void fullName(String name) {
    state = name; // updates state
  }
}
