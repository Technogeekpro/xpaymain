import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';

class CurrencyExchangeController extends GetxController {
  final dropdownWalletController = TextEditingController();
  final agentUsernameOrEmailController = TextEditingController();
  final amountController = TextEditingController();

  List<String> formCurrencyList = ['USD', 'GBP', 'BDT'];
  List<String> toCurrencyList = ['USD', 'GBP', 'BDT'];
  RxString formCurrencyName = ''.obs;
  RxString toCurrencyName = ''.obs;

  @override
  void onInit() {
    formCurrencyName.value = formCurrencyList[0];
    toCurrencyName.value = toCurrencyList[0];
    amountController.text = '0';
    super.onInit();
  }

  @override
  void dispose() {
    dropdownWalletController.dispose();
    agentUsernameOrEmailController.dispose();
    amountController.dispose();

    super.dispose();
  }

  navigateToDashboardScreen() {
    Get.toNamed(Routes.navigationScreen);
  }

  navigateToConfirmCurrencyExchangeScreen() {
    Get.toNamed(Routes.confirmCurrencyExchangeScreen);
  }
}
