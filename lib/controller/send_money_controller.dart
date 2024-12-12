import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';

class SendMoneyController extends GetxController {
  RxDouble animatedHeight = 130.0.obs;

  final phoneNumberSendMoneyController = TextEditingController();
  final amountSendMoneyController = TextEditingController();
  final pinSendMoneyController = TextEditingController();
  final referenceSendMoneyController = TextEditingController();

  @override
  void dispose() {
    phoneNumberSendMoneyController.dispose();
    pinSendMoneyController.dispose();
    referenceSendMoneyController.dispose();
    amountSendMoneyController.dispose();
    super.dispose();
  }

  changeAnimatedHeight(value) {
    animatedHeight.value = value;
  }

  navigateToAddAmountScreen() {
    Get.toNamed(Routes.addAmountSendMoneyScreen);
  }

  navigateToPinScreen() {
    Get.toNamed(Routes.pinScreen);
  }

  navigateToReviewScreen() {
    Get.toNamed(Routes.reviewSendMoneyScreen);
  }

  navigateToDashboardScreen() {
    Get.toNamed(Routes.navigationScreen);
  }
}
