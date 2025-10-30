import 'package:flutter_riverpod/legacy.dart';

final infoSPod = StateProvider<String>((ref) {
  return "This is a simple info";
});

final countSPod = StateProvider<int>((ref) {
  return 42;
});

final sliderSPod = StateProvider<double>((ref) {
  return 42;
});

final isActiveSPod = StateProvider<bool>((ref) {
  return true;
});

final itemsSPod = StateProvider<List<String>>((ref) {
  return ["Apple", "Banana", "Orange"];
});
