import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/navigation_controller.dart';
import '../../utils/custom_color.dart';
import '../../utils/strings.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({
    Key? key,
  }) : super(key: key);
  final controller = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        onTap: controller.onTapChangeIndex,
        currentIndex: controller.currentIndex.value,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        type: BottomNavigationBarType.fixed,
        backgroundColor: CustomColor.secondaryColor,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,

        elevation: 0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: Strings.home.tr),
          BottomNavigationBarItem(
              icon: Icon(Icons.forward_to_inbox), label: Strings.inbox.tr),
        ],
      ),
    );
  }
}
