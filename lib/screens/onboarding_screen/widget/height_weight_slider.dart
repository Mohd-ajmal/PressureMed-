import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:list_wheel_scroll_view_nls/list_wheel_scroll_view_nls.dart';

typedef void StringCallback(String val);

class WeightHeightSlider extends StatefulWidget {
  StringCallback callback;
  int selectedIndex;

  WeightHeightSlider(
      {super.key, required this.callback, required this.selectedIndex});

  @override
  State<WeightHeightSlider> createState() => _WeightHeightSliderState();
}

class _WeightHeightSliderState extends State<WeightHeightSlider> {
  final FixedExtentScrollController _scrollController =
      FixedExtentScrollController(initialItem: 10);
  int selectedIndex = 10;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.asset(
              height: 200,
              width: 80,
              "assets/images/weight_height_identification.png"),
        ),
        RotatedBox(
          quarterTurns: -1,
          child: ListWheelScrollView(
            controller: _scrollController,
            itemExtent: 25,
            useMagnifier: true,
            onSelectedItemChanged: (newIndex) {
              setState(() {
                selectedIndex = newIndex;
                widget.callback.call(selectedIndex.toString());
              });
            },
            children: List.generate(
              200,
              (index) => RotatedBox(
                quarterTurns: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    index % 5 == 0
                        ? Column(
                            children: [
                              const SizedBox(
                                height: 55,
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 400),
                                height: 65,
                                width: 3,
                                color: Colors.black54,
                                alignment: Alignment.center,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              index != selectedIndex ? Text("${index}") : Text("")
                            ],
                          )
                        : AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            height: 45,
                            width: 3,
                            color: Colors.black12,
                            alignment: Alignment.center,
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
