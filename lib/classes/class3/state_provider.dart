// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mypod/classes/data/state_provider_bank.dart';

/*
in this we learn about StateProvider
StateProvider useed to manage simple mutable state in Riverpod.
StateProvider useed with consumer widgets to read and update state.
Key Points:
•	StateProvider = mutable state managed by Riverpod
•	Works with both Stateless and Stateful widgets
•	Use ref.watch() to observe and rebuild
•	Use ref.read().notifier.state to update value
•	Ideal for counters, switches or any dynamic variable
*/

// counter & switch example using StateProvider for stateLess widget
class StateProviderLess extends ConsumerWidget {
  const StateProviderLess({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("build Scaffold");
    final tempinfo = ref.watch(
      infoSPod,
    ); // it build complete scaffold when infoSPod change
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("this is inf: $tempinfo"),
            SizedBox(height: 100),
            Consumer(
              builder: (context, ref, child) {
                print("build counter");
                final tempCount = ref.watch(
                  countSPod,
                ); // // it build only this Text when countSPod change
                return Text("this is counter: $tempCount");
              },
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref.read(countSPod.notifier).state++;
                  },
                  child: const Text("+"),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    ref.read(countSPod.notifier).state--;
                  },
                  child: const Text("-"),
                ),
              ],
            ),
            SizedBox(height: 40),
            // switch example
            Consumer(
              builder: (context, ref, child) {
                print("build Switch");
                final tempIsActive = ref.watch(isActiveSPod);
                return Switch(
                  value: tempIsActive,
                  onChanged: (value) {
                    ref.read(isActiveSPod.notifier).state = value;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// counter & switch example using StateProvider for stateFull widget
class StateProviderFull extends ConsumerStatefulWidget {
  const StateProviderFull({super.key});
  @override
  ConsumerState<StateProviderFull> createState() => _StateProviderFullState();
}

class _StateProviderFullState extends ConsumerState<StateProviderFull> {
  @override
  Widget build(BuildContext context) {
    print("build Scaffold");
    final tempinfo = ref.watch(
      infoSPod,
    ); // it build complete scaffold when infoSPod change
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("this is inf: $tempinfo"),
            SizedBox(height: 100),
            Consumer(
              builder: (context, ref, child) {
                print("build counter");
                final tempCount = ref.watch(
                  countSPod,
                ); // // it build only this Text when countSPod change
                return Text("this is counter: $tempCount");
              },
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref.read(countSPod.notifier).state++;
                  },
                  child: const Text("+"),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    ref.read(countSPod.notifier).state--;
                  },
                  child: const Text("-"),
                ),
              ],
            ),
            SizedBox(height: 40),
            // switch example
            Consumer(
              builder: (context, ref, child) {
                print("build Switch");
                final tempIsActive = ref.watch(isActiveSPod);
                return Switch(
                  value: tempIsActive,
                  onChanged: (value) {
                    ref.read(isActiveSPod.notifier).state = value;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
