import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';

class PayBillController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  final searchOrganizationController = TextEditingController();
  final meterNumberController = TextEditingController();
  final organizationNameController = TextEditingController();

  // tab controller with getx
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  // overriding the dispose in getx controller
  @override
  void dispose() {
    searchOrganizationController.dispose();

    super.dispose();
  }

  navigateToDashboardScreen() {
    Get.toNamed(Routes.navigationScreen);
  }

  navigateToPrepaidTokenScreen() {
    Get.toNamed(Routes.prepaidTokenScreen);
  }
}
