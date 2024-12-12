import 'dart:ui';

import 'package:get/get.dart';

import '../utils/local_storage.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    var languageList = LocalStorage.getLanguage();
    var locale = Locale(languageList[0], languageList[1]);
    Get.updateLocale(locale);
  }
}
