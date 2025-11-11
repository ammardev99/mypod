// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mypod/classes/class5/multi_s.dart';

class MultiStateUI extends ConsumerWidget {
  const MultiStateUI({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("Build scaffold");

    return Scaffold(
      appBar: AppBar(title: Text("Search Example")),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: "Enter search..."),
            onChanged: (value) {
              ref.read(searchSNPod.notifier).searchFnc(value);
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              print("Build Switch");
              final isOffer = ref.watch(
                searchSNPod.select((state) => state.getOffer),
              );
              return Switch(
                value: isOffer,
                onChanged: (value) {
                  ref.read(searchSNPod.notifier).onChangeOffer(value);
                },
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final searchTemp = ref.watch(
                searchSNPod.select((state) => state.searchItem),
              ); // full model
              print("Build Text");
              return Text("Search: $searchTemp");
            },
          ),
        ],
      ),
    );
  }
}
