import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpay/utils/dimensions.dart';
import 'package:xpay/views/dashboard/dashboard_screen.dart';
import 'package:xpay/views/dashboard/inbox_screen.dart';

import '../controller/navigation_controller.dart';
import '../utils/custom_color.dart';
import '../utils/strings.dart';
import '../widgets/bottom_navbar_widget.dart';

class NavigationScreen extends StatelessWidget {
  NavigationScreen({Key? key}) : super(key: key);
  final _controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Obx(
        () => IndexedStack(
          index: _controller.currentIndex.value,
          children: [
            DashboardScreen(),
            const IndexScreen(),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
              // backgroundColor:
              onPressed: () {
                _controller.navigateToTransferMoneyScreen();
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: CustomColor.primaryColor,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(15),
                  side: const BorderSide(
                      color: CustomColor.secondaryColor, width: 4)),
              child: Image.asset(
                Strings.paperPlaneImagePath,
                scale: 1.2,
              )),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          Text(
            Strings.transfer.tr,
            style: TextStyle(
              color: CustomColor.primaryColor,
              fontSize: Dimensions.smallestTextSize,
              fontWeight: FontWeight.w200,
            ),
          ),
          SizedBox(
            height: Dimensions.heightSize * 0.5,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
