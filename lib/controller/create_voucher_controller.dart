import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';

class CreateVoucherController extends GetxController {
  final dropdownWalletController = TextEditingController();
  final receiverUsernameOrEmailController = TextEditingController();
  final amountController = TextEditingController();
  final voucherCodeController = TextEditingController();

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
    receiverUsernameOrEmailController.dispose();
    amountController.dispose();
    voucherCodeController.dispose();

    super.dispose();
  }

  navigateToDashboardScreen() {
    Get.toNamed(Routes.navigationScreen);
  }

  navigateToConfirmCreateVoucherOutScreen() {
    Get.toNamed(Routes.confirmCreateVoucherOutScreen);
  }

  navigateToTransferMoneyScanQrCodeScreen() {
    Get.toNamed(Routes.transferMoneyScanQrCodeScreen);
  }

  navigateToCreateVoucherScreen() {
    Get.toNamed(Routes.createVoucherScreen);
  }

  navigateToRedeemVoucherScreen() {
    Get.toNamed(Routes.redeemVoucherScreen);
  }

  navigateToConfirmCreateVoucherCodeOutScreen() {
    Get.toNamed(Routes.confirmCreateVoucherCodeOutScreen);
  }
}
