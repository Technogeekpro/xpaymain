import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../routes/routes.dart';

List<String> languageList = [
  'English ',
  'Spanish',
  'Chinese',
  'Hindi',
];

class DashboardController extends GetxController {
  RxBool showBalance = true.obs;
  RxInt activeIndex = 0.obs;
  RxBool isPending = false.obs;
  RxString termDropdownValue = languageList[0].obs;

  final List<String> languageValueList = languageList;

  final changeNameController = TextEditingController();
  final chatController = TextEditingController();
  final dropdownController = TextEditingController();
  final nidNameController = TextEditingController();
  final nidNumberController = TextEditingController();

  @override
  void dispose() {
    changeNameController.dispose();
    chatController.dispose();
    dropdownController.dispose();
    super.dispose();
  }

  navigateToDashboardScreen() {
    Get.toNamed(Routes.navigationScreen);
  }

  changeBalanceStatus() async {
    showBalance.value = !showBalance.value;
    await Future.delayed(const Duration(seconds: 5));
    showBalance.value = !showBalance.value;
  }

  changeIndicator(int value) {
    activeIndex.value = value;
  }

  navigateToInvoiceScreen() {
    Get.toNamed(Routes.invoiceScreen);
  }

  navigateToVoucherScreen() {
    Get.toNamed(Routes.voucherScreen);
  }

  navigateToSendMoney() {
    Get.toNamed(Routes.addNumberSendMoneyScreen);
  }

  navigateToMakePaymentScreen() {
    Get.toNamed(Routes.makePaymentScreen);
  }

  navigateToMoneyOutScreen() {
    Get.toNamed(Routes.moneyOutScreen);
  }

  navigateToAddNumberPaymentScreen() {
    Get.toNamed(Routes.addNumberPaymentScreen);
  }

  navigateToAddMoneyScreen() {
    Get.toNamed(Routes.addMoneyMoneyScreen);
  }

  navigateToRequestScreen() {
    Get.toNamed(Routes.requestScreen);
  }

  navigateToTransferMoneyScreen() {
    Get.toNamed(Routes.transferMoneyScreen);
  }

  navigateToCurrencyExchangeScreen() {
    Get.toNamed(Routes.currencyExchangeScreen);
  }

  navigateToSavingRulesScreen() {
    Get.toNamed(Routes.savingRulesScreen);
  }

  navigateToRemittanceSourceScreen() {
    Get.toNamed(Routes.remittanceSourceScreen);
  }

  navigateToWithdrawScreen() {
    Get.toNamed(Routes.withdrawScreen);
  }

  navigateToRequestToMeScreen() {
    Get.toNamed(Routes.requestToMeScreen);
  }

  navigateToAddMoneyHistoryScreen() {
    Get.toNamed(Routes.addMoneyHistoryScreen);
  }

  navigateToTransactionHistoryScreen() {
    Get.toNamed(Routes.transactionsHistoryScreen);
  }

  navigateToWithdrawHistoryScreen() {
    Get.toNamed(Routes.withdrawHistoryScreen);
  }

  navigateToMyQrCodeScreen() {
    Get.toNamed(Routes.myQrCodeScreen);
  }

  navigateToXPayMapScreen() {
    Get.toNamed(Routes.xPayMapScreen);
  }

  navigateToSettingScreen() {
    Get.toNamed(Routes.settingsScreen);
  }

  navigateToChangeNameScreen() {
    Get.toNamed(Routes.changeNameScreen);
  }

  navigateToChangePictureScreen() {
    Get.toNamed(Routes.changePictureScreen);
  }

  navigateToSupportScreen() {
    Get.toNamed(Routes.supportScreen);
  }

  navigateToLiveChatScreen() {
    Get.toNamed(Routes.liveChatScreen);
  }

  navigateToVerifyAccountScreen() {
    Get.toNamed(Routes.verifyAccountScreen);
  }

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> signOut() async {
    try {
      await GetStorage().erase();

      await FirebaseAuth.instance.signOut();
      Get.offAllNamed(Routes.onBoardScreen);
    } catch (e) {
      print('Error signing out: $e');
    }
  }
}
