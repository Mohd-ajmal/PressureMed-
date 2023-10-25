import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pressuremed/constants/app_colors.dart';
import 'package:pressuremed/constants/app_fonts.dart';
import 'package:pressuremed/hooks/button_container.dart';
import 'package:pressuremed/screens/onboarding_screen/height_screen.dart';
import 'package:pressuremed/screens/onboarding_screen/widget/height_weight_slider.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({super.key});

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

int _selectedWeightType = 0;
int _selectedIndex = 10;

class _WeightScreenState extends State<WeightScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            elevation: 0,
            backgroundColor: AppColors.backgroundColor,
            leading: InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 15),
                child: Text("Skip",
                    style: primaryFont.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.text,
                    )),
              ),
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("What is your weight?",
                    style: primaryFont.copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: AppColors.text,
                    )),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedWeightType = 0;
                        });
                      },
                      child: Container(
                        width: 150,
                        height: 60,
                        alignment: Alignment.center,
                        decoration: _selectedWeightType == 0
                            ? BoxDecoration(
                                color: const Color(0xff242E49),
                                border: Border.all(
                                    width: 5, color: Color(0xffb7bbc2)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              )
                            : const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18)),
                              ),
                        child: Text(
                          "lbs",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: _selectedWeightType == 0
                                  ? Colors.white
                                  : AppColors.text),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedWeightType = 1;
                        });
                      },
                      child: Container(
                        width: 150,
                        height: 60,
                        alignment: Alignment.center,
                        decoration: _selectedWeightType == 1
                            ? BoxDecoration(
                                color: const Color(0xff242E49),
                                border: Border.all(
                                    width: 5, color: const Color(0xffb7bbc2)),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                              )
                            : const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                        child: Text(
                          "Kg",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: _selectedWeightType == 1
                                  ? Colors.white
                                  : AppColors.text),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedIndex.toString(),
                        style: const TextStyle(
                            color: AppColors.text,
                            fontWeight: FontWeight.bold,
                            fontSize: 68)),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(_selectedWeightType == 0 ? "lbs" : "Kg ",
                        style: const TextStyle(
                            color: AppColors.text, fontSize: 15))
                  ],
                ),
                Container(
                    height: 200,
                    child: WeightHeightSlider(
                      callback: (value) {
                        setState(() {
                          _selectedIndex = int.parse(value);
                        });
                      },
                      selectedIndex: _selectedIndex,
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(const HeightScreen());
                    },
                    child: NextContainer(
                        text: "Continue",
                        image: "assets/icons/arrowForword.png"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
