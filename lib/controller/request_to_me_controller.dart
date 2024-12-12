import 'package:get/get.dart';

import '../routes/routes.dart';

class RequestToMeController extends GetxController {
  RxString methodName = ''.obs;
  RxString walletName = ''.obs;
  RxString currencyName = ''.obs;

  navigateToDashboardScreen() {
    Get.toNamed(Routes.navigationScreen);
  }

  navigateToRequestToMeWalletInfoScreen() {
    Get.toNamed(Routes.requestToMeWalletInfoScreen);
  }

  navigateToConfirmRequestToMeScreen() {
    Get.toNamed(Routes.confirmRequestToMeScreen);
  }
}
