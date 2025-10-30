import 'package:flutter_riverpod/flutter_riverpod.dart';

final infoPod = Provider<String>((ref) {
  return "This is a simple provider example";
});

final countPod = Provider<int>((ref) {
  return 42;
});

final isActivePod = Provider<bool>((ref) {
  return true;
});

final itemsPod = Provider<List<String>>((ref) {
  return ["Apple", "Banana", "Orange"];
});
