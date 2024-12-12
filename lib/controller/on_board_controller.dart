import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xpay/data/onboard_model.dart';

import '../routes/routes.dart';
import '../utils/custom_color.dart';
import '../utils/strings.dart';
import '../widgets/buttons/primary_button.dart';

class OnboardController extends GetxController {
  var selectedPageIndex = 0.obs;
  var pageController = PageController();

  bool get isLastPage => selectedPageIndex.value == onBoardModePages.length;

  bool get isFirstPage => selectedPageIndex.value == 0;

  bool get isSecondPage => selectedPageIndex.value == 1;

  bool get isThirdPage => selectedPageIndex.value == 2;

  void nextPage() {
    if (isLastPage) {
    } else {
      pageController.nextPage(
        duration: 300.milliseconds,
        curve: Curves.ease,
      );
    }
  }

  void backPage() {
    pageController.previousPage(
      duration: 300.milliseconds,
      curve: Curves.ease,
    );
  }

// navigate to the welcome screen
  pageNavigate() {
    Get.toNamed(Routes.welcomeScreen);
  }

  AnimatedContainer buildLine({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 6.h,
      width: 100.w,
      decoration: BoxDecoration(
        color: index! <= selectedPageIndex.value
            ? CustomColor.primaryColor
            : Colors.white,
        shape: BoxShape.rectangle,
      ),
    );
  }

// generate the line equal to page List length
  lineWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onBoardModePages.length,
        (index) => buildLine(index: index),
      ),
    );
  }

  // button widget with color and size
  buttonWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 36.w,
      ),
      child: SizedBox(
          width: 342.76.w,
          height: 55.h,
          child: PrimaryButton(
            onPressed: () {
              isFirstPage || isSecondPage ? nextPage() : pageNavigate();
            },
            borderColorName: CustomColor.primaryColor,
            borderWidth: 0,
            title: isFirstPage || isSecondPage
                ? Strings.next.tr
                : Strings.getStarted.tr,
          )),
    );
  }
}
