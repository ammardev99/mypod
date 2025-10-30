import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mypod/classes/data/model_bank.dart';
import 'package:mypod/classes/data/state_provider_bank.dart';

/*
here we learn wrap with
now we create a box have x & y sides show values seprately
and we move ref.watch(areaC) to ref.watch(areaC) to
ref.watch(areaC.select((state)=> state.xSide))
now it return only targeted value like xSide no need to call or metion driectily
core it to learn select state to and create class and copywith method


*/
class MultipleState4 extends ConsumerWidget {
  const MultipleState4({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          Consumer(
            builder: (context, ref, child) {
              final slider = ref.watch(sliderSPod);
              return Text(slider.toString());
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final slider = ref.watch(sliderSPod);
              return Slider(
                value: slider,
                onChanged: (value) {
                  ref.read(sliderSPod.notifier).state = value;
                },
              );
            },
          ),
          Divider(),
          Consumer(
            builder: (context, ref, child) {
              final box = ref.watch(areaC.select((state)=> state.xSide));
              return Text("Box: x = $box");
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final box = ref.watch(areaC);
              final stateProvider = ref.read(areaC.notifier);
              return Row(
                children: [
                  Slider(
                    value: box.xSide,
                    onChanged: (value) {
                      stateProvider.state = stateProvider.state.copyWith(
                        xSide: value,
                      );
                    },
                  ),
                  SizedBox(width: 10),
                  Slider(
                    value: box.ySide,
                    onChanged: (value) {
                      stateProvider.state = stateProvider.state.copyWith(
                        ySide: value,
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
