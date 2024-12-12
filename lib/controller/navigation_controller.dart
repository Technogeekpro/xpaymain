import 'package:get/get.dart';

import '../routes/routes.dart';

class NavigationController extends GetxController {
  var currentIndex = 0.obs;
  List pages = [];

  void onTapChangeIndex(int index) {
    currentIndex.value = index;
    update();
  }

  navigateToTransferMoneyScreen() {
    Get.toNamed(Routes.transferMoneyScreen);
  }
}
