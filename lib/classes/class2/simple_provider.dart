import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../data/data_bank.dart';
/*
here you learn about the simplest provider in riverpod
update stateless to consumer widget to use provider
and statefull to consumer stateful widget

ref.watch(provider)
ref.read(provider)
ref.listen(provider, (prev, next){})

Key Notes
ProviderScope — container for all providers
ConsumerWidget — used for stateless widgets
ConsumerStatefulWidget — used for stateful widgets
ref.watch() — listens and rebuilds
ref.read() — reads once
Used for constants, dependencies, or simple data sharing
 */

// StateLess to ConsumerWidget Example
class SimpleProvider1 extends ConsumerWidget {
  const SimpleProvider1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final temp = ref.watch(infoPod);
    return Scaffold(body: Center(child: Text("Hello this is info: $temp")));
  }
}

// StateFull to ConsumerWidget Example

class SimpleProvide2 extends ConsumerStatefulWidget {
  const SimpleProvide2({super.key});

  @override
  ConsumerState<SimpleProvide2> createState() => _SimpleProvide2State();
}

class _SimpleProvide2State extends ConsumerState<SimpleProvide2> {
  @override
  Widget build(BuildContext context) {
    final temp = ref.watch(infoPod);
    return Scaffold(body: Center(child: Text("Hello this is info: $temp")));
  }
}
