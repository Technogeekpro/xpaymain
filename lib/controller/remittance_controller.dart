import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';

class RemittanceController extends GetxController {
  RxDouble animatedHeight = 130.0.obs;

  final phoneNumberRemittanceController = TextEditingController();
  final amountRemittanceController = TextEditingController();
  final pinRemittanceController = TextEditingController();
  final referenceRemittanceController = TextEditingController();

  @override
  void dispose() {
    phoneNumberRemittanceController.dispose();
    pinRemittanceController.dispose();
    referenceRemittanceController.dispose();
    amountRemittanceController.dispose();
    super.dispose();
  }

  changeAnimatedHeight(value) {
    animatedHeight.value = value;
  }

  navigateToAddAmountRemittanceMoneyScreen() {
    Get.toNamed(Routes.addAmountRemittanceMoneyScreen);
  }

  navigateToPinRemittanceScreen() {
    Get.toNamed(Routes.pinRemittanceScreen);
  }

  navigateToReviewRemittanceScreen() {
    Get.toNamed(Routes.reviewRemittanceScreen);
  }

  navigateToDashboardScreen() {
    Get.toNamed(Routes.navigationScreen);
  }
}
