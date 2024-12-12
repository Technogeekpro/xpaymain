import 'package:get/get.dart';

import '../routes/routes.dart';

class WelcomeController extends GetxController {
  // all navigation from welcome screen
  navigateToLogin() {
    Get.toNamed(Routes.loginScreen);
  }

  navigateToRegisterScreen() {
    Get.toNamed(Routes.registerScreen);
  }
}
