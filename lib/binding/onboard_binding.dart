import 'package:get/get.dart';

import '../controller/on_board_controller.dart';

class OnBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OnboardController());
  }
}
