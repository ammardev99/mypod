// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mypod/classes/data/model_bank.dart';
import 'package:mypod/config/formatting.dart';

class MultiStatePractice extends ConsumerWidget {
  const MultiStatePractice({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("build scaffold");
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Multi State Practice'),
            Divider(),
            gapBox(10),
            // radious only
            Consumer(
              builder: (context, ref, child) {
                final temp = ref.watch(
                  practiceP.select((state) => state.radious),
                );
                final tempProvider = ref.read(practiceP.notifier);
                print("build Radious ${temp.toStringAsFixed(0)}");
                return Column(
                  children: [
                    // for radious
                    Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(
                              tempProvider.state.radious,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10), // or your gapBox(10)
                        SizedBox(
                          width: 180,
                          child: Slider(
                            value: temp,
                            min: 0,
                            max: 99,
                            onChanged: (value) {
                              tempProvider.state = tempProvider.state.copyWith(
                                radious: value,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            // opecity only
            Consumer(
              builder: (context, ref, child) {
                final temp = ref.watch(practiceP.select((state) => state.opty));
                print("build opecity ${temp.toStringAsFixed(1)}");
                final tempMaster = ref.read(practiceP.notifier);
                return Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color: Colors.amber.withOpacity(temp),
                        borderRadius: BorderRadius.circular(temp),
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      child: Slider(
                        padding: EdgeInsets.zero,
                        value: temp,
                        min: 0,
                        max: 1,
                        onChanged: (value) {
                          tempMaster.state = tempMaster.state.copyWith(
                            opty: value,
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
            // vari width only
            gapBox(10),
            Consumer(
              builder: (context, ref, child) {
                final tempWidth = ref.watch(
                  practiceP.select((state) => state.xSide),
                );
                final controller = ref.read(practiceP.notifier);
                print("build width ${tempWidth.toStringAsFixed(1)}");
                return Column(
                  children: [
                    Container(
                      width: tempWidth,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(height: 10), // or your gapBox(10)
                    Slider(
                      value: tempWidth,
                      min: 0,
                      max: 280,
                      onChanged: (value) {
                        controller.state = controller.state.copyWith(
                          xSide: value,
                        );
                      },
                    ),
                  ],
                );
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                print("build text");
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Radious: ${ref.watch(practiceP.select((state) => state.radious)).toStringAsFixed(1)}',
                    ),
                    Text(
                      'Opecity: ${ref.watch(practiceP.select((state) => state.opty)).toStringAsFixed(1)}',
                    ),
                    Text(
                      'Width: ${ref.watch(practiceP.select((state) => state.xSide)).toStringAsFixed(1)}',
                    ),
                  ],
                );
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
