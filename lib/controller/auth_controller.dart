import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';

class AuthController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final firstNameAuthController = TextEditingController();
  final lastNameAuthController = TextEditingController();
  final emailAuthController = TextEditingController();
  final phoneNumberAuthController = TextEditingController();

  final pinLoginController = TextEditingController();

  final legalNameOfCompanyController = TextEditingController();
  final representativeFirstNameController = TextEditingController();
  final representativeLastNameController = TextEditingController();

  final companyPasswordController = TextEditingController();
  final companyConfirmPasswordController = TextEditingController();
  final companyEmailAuthController = TextEditingController();
  final companyUsernameController = TextEditingController();
  final companyPhoneNumberAuthController = TextEditingController();
  final countryController = TextEditingController();

  RxBool isChecked = false.obs;
  RxString countryCode = '+1'.obs;

  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberAuthController.dispose();
    firstNameAuthController.dispose();
    lastNameAuthController.dispose();
    emailAuthController.dispose();
    pinLoginController.dispose();
    companyPasswordController.dispose();
    companyConfirmPasswordController.dispose();
    companyEmailAuthController.dispose();
    companyUsernameController.dispose();
    companyPhoneNumberAuthController.dispose();
    countryController.dispose();
    super.dispose();
  }

  navigateToRegisterScreen() {
    Get.toNamed(Routes.registerScreen);
  }

  navigateToForgetPinScreen() {
    Get.toNamed(Routes.forgetPasswordScreen);
  }

  navigateToOTPScreen() {
    Get.toNamed(Routes.otpScreen);
  }

  navigateToResetPasswordScreen() {
    Get.toNamed(Routes.resetPasswordScreen);
  }

  navigateToLoginScreen() {
    Get.toNamed(Routes.loginScreen);
  }

  navigateToNidPassportScreen() {
    Get.toNamed(Routes.nidPassportScreen);
  }

  navigateToCongratulationsScreen() {
    Get.toNamed(Routes.congratulationsScreen);
  }

  navigateToDashboardScreen() {
    Get.toNamed(Routes.navigationScreen);
  }
}
