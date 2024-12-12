import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

const String language = "language";
const String smallLanguage = "smallLanguage";
const String capitalLanguage = "capitalLanguage";

class LocalStorage {
  static Future<void> saveLanguage({
    required String langSmall,
    required String langCap,
  }) async {
    final box1 = GetStorage();
    final box2 = GetStorage();

    var locale = Locale(langSmall, langCap);
    Get.updateLocale(locale);
    await box1.write(smallLanguage, langSmall);
    await box2.write(capitalLanguage, langCap);
  }

  static List getLanguage() {
    String small = GetStorage().read(smallLanguage) ?? 'us';
    String capital = GetStorage().read(capitalLanguage) ?? 'US';
    return [small, capital];
  }

  static Future<void> changeLanguage() async {
    final box = GetStorage();
    await box.remove(language);
  }
}
