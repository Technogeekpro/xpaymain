import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpay/utils/dimensions.dart';
import 'package:xpay/utils/utils.dart';

import '../controller/dashboard_controller.dart';
import '../utils/custom_color.dart';
import '../utils/strings.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    return Drawer(
      child: Container(
        color: CustomColor.secondaryColor,
        child: _allItemListView(context, controller),
      ),
    );
  }

  buildMenuItem(BuildContext context,
      {required String title,
      required String imagePath,
      required VoidCallback onTap}) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.defaultPaddingSize,
          ),
          child: ListTile(
            dense: true,
            leading: Image.asset(imagePath),
            title: Text(
              title,
              style: TextStyle(
                color: CustomColor.primaryTextColor,
                fontSize: Dimensions.smallestTextSize,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: onTap,
          ),
        ),
        Divider(
          color: CustomColor.primaryColor.withOpacity(0.5),
          thickness: 1,
        ),
      ],
    );
  }

  _drawerItems(BuildContext context, DashboardController controller) {
    return Column(
      children: [
        // buildMenuItem(
        //   context,
        //   imagePath: Strings.withdrawMoneyImagePath,
        //   title: Strings.withdrawMoney.tr,
        //   onTap: () {
        //     controller.navigateToWithdrawScreen();
        //   },
        // ),
        buildMenuItem(
          context,
          imagePath: Strings.requestToMeImagePath,
          title: Strings.requestMoney.tr,
          onTap: () {
            controller.navigateToRequestToMeScreen();
          },
        ),
        buildMenuItem(
          context,
          imagePath: Strings.addMoneyHistoryImagePath,
          title: 'Transaction History',
          onTap: () {
            controller.navigateToTransactionHistoryScreen();
          },
        ),
        // buildMenuItem(
        //   context,
        //   imagePath: Strings.withdrawHistoryImagePath,
        //   title: Strings.withdrawHistory.tr,
        //   onTap: () {
        //     controller.navigateToWithdrawHistoryScreen();
        //   },
        // ),
        // buildMenuItem(
        //   context,
        //   imagePath: Strings.myQRcodeImagePath,
        //   title: Strings.myQRcode.tr,
        //   onTap: () {
        //     controller.navigateToMyQrCodeScreen();
        //   },
        // ),
        buildMenuItem(
          context,
          imagePath: Strings.settingsImagePath,
          title: Strings.settings.tr,
          onTap: () {
            controller.navigateToSettingScreen();
          },
        ),
        buildMenuItem(
          context,
          imagePath: Strings.supportImagePath,
          title: Strings.support.tr,
          onTap: () async => await Utils.sendEmail(
              'digitalpayments.usa@gmail.com', 'Digital Payments App', 'Hi\,'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.defaultPaddingSize,
          ),
          child: ListTile(
            dense: true,
            leading: Image.asset(Strings.logoutImagePath),
            title: Text(
              Strings.signOut.tr,
              style: TextStyle(
                color: CustomColor.primaryTextColor,
                fontSize: Dimensions.smallestTextSize,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              Utils.showConfirmationDialog(
                  context,
                  'Confirm Sign Out',
                  'Are you sure you want to sign out?',
                  'Sign Out',
                  'Cancel',
                  () async => await controller.signOut());
            },
          ),
        ),
        SizedBox(
          height: Dimensions.heightSize * 4,
        )
      ],
    );
  }

  _allItemListView(BuildContext context, DashboardController controller) {
    return ListView(
      children: [
        SizedBox(
          height: Dimensions.heightSize * 3,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: Dimensions.defaultPaddingSize,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                Strings.splashScreenImagePath,
                scale: 1.8,
              ),
              SizedBox(
                height: Dimensions.heightSize * 4,
              ),
            ],
          ),
        ),
        _drawerItems(context, controller),
      ],
    );
  }
}
