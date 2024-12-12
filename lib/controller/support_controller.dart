import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';

class SupportController extends GetxController {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    subjectController.dispose();
    messageController.dispose();
    super.dispose();
  }

  navigateToDashboardScreen() {
    Get.toNamed(Routes.navigationScreen);
  }

  navigateToCreateSupportTicketScreen() {
    Get.toNamed(Routes.createSupportTicketScreen);
  }

  navigateToMySupportTickets() {
    Get.toNamed(Routes.mySupportTickets);
  }
}
