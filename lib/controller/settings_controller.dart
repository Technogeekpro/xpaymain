import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpay/data/user_model.dart';

import '../routes/routes.dart';

class SettingsController extends GetxController {
  File? userPhoto;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final addressController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();
  final zipController = TextEditingController();
  final countryController = TextEditingController();
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmController = TextEditingController();

  var selectedLanguage = "".obs;

  onChangeLanguage(var language) {
    selectedLanguage.value = language;
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    addressController.dispose();
    stateController.dispose();
    cityController.dispose();
    zipController.dispose();
    countryController.dispose();
    countryController.dispose();
    oldPasswordController.dispose();
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  navigateToDashboardScreen() {
    Get.toNamed(Routes.navigationScreen);
  }

  navigateToUpdateProfileScreen() {
    Get.toNamed(Routes.updateProfileScreen);
  }

  navigateToChangePasswordScreen() {
    Get.toNamed(Routes.changePasswordScreen);
  }

  navigateToTwoFaSecurity() {
    Get.toNamed(Routes.twoFaSecurity);
  }

  navigateToChangeLanguageScreen() {
    Get.toNamed(Routes.changeLanguageScreen);
  }

  void bindData(UserModel user) {
    firstNameController.text = user.firstName;
    lastNameController.text = user.lastName;
    emailController.text = user.emailAddress;
    mobileController.text = user.mobile;
    addressController.text = user.address ??= '';
    stateController.text = user.state ??= '';
    cityController.text = user.city ??= '';
    zipController.text = user.zipCode ??= '';
  }
}
