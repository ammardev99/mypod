// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mypod/classes/class5/provider_data.dart';

class PersonScreen extends ConsumerWidget {
  const PersonScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("rebuild scaffold");

    return Scaffold(
      appBar: AppBar(title: Text('Person Notifier Example')),
      body: Column(
        children: [
          Consumer(
            builder: (context, ref, child) {
              print("rebuild text");
              final personTemp = ref.watch(personSNPod); // current state
              return Text("Full Name: $personTemp");
            },
          ),
          TextField(
            onChanged: (value) {
              ref.read(personSNPod.notifier).fullName(value);
            },
          ),
        ],
      ),
    );
  }
}
