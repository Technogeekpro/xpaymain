import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';

class PaymentController extends GetxController {
  final dropdownWalletController = TextEditingController();
  final merchantUsernameOrEmailController = TextEditingController();
  final amountController = TextEditingController();

  List<String> walletList = ['USD', 'GBP', 'BDT'];
  RxString walletName = ''.obs;
  RxDouble charge = 0.00.obs;
  RxDouble chargeCalculated = 0.00.obs;
  RxDouble fixedCharge = 0.00.obs;

  double calculateCharge(double value) {
    fixedCharge.value = 2.00;
    charge.value = 0.00;
    chargeCalculated.value = 0.00;
    double extraCharge = value * .01;
    chargeCalculated.value = extraCharge;
    charge.value = chargeCalculated.value + fixedCharge.value;
    if (value == 0) {
      chargeCalculated.value = 0.00;
      charge.value = 0.00;
      return 0.00;
    }
    return chargeCalculated.value + fixedCharge.value;
  }

  @override
  void onInit() {
    walletName.value = walletList[0];
    amountController.text = '0';
    super.onInit();
  }

  @override
  void dispose() {
    dropdownWalletController.dispose();
    merchantUsernameOrEmailController.dispose();
    amountController.dispose();

    super.dispose();
  }

  navigateToDashboardScreen() {
    Get.toNamed(Routes.navigationScreen);
  }

  navigateToMakePaymentScanQrCodeScreen() {
    Get.toNamed(Routes.makePaymentScanQrCodeScreen);
  }

  navigateToConfirmMakePaymentOutScreen() {
    Get.toNamed(Routes.confirmMakePaymentOutScreen);
  }
}