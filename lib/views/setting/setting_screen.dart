import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/settings_controller.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/primary_appbar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());
    return Scaffold(
      backgroundColor: CustomColor.screenBGColor,
      appBar: PrimaryAppBar(
        appbarSize: Dimensions.defaultAppBarHeight,
        toolbarHeight: Dimensions.defaultAppBarHeight,
        title: Text(
          Strings.settings.tr,
          style: CustomStyle.commonTextTitleWhite,
        ),
        appBar: AppBar(),
        backgroundColor: CustomColor.primaryColor,
        autoLeading: false,
        elevation: 1,
        appbarColor: CustomColor.secondaryColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: Dimensions.iconSizeDefault * 1.4,
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: _bodyWidget(context, controller),
      ),
    );
  }

  // body widget contain all the widgets
  _bodyWidget(BuildContext context, SettingsController controller) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: _selectOptionWidget(context, controller),
    );
  }

  _selectOptionWidget(BuildContext context, SettingsController controller) {
    return Column(
      children: [
        settingsItemWidget(
          controller,
          onTap: () {
            controller.navigateToUpdateProfileScreen();
          },
          title: Strings.updateProfile.tr,
        ),
        SizedBox(
          height: Dimensions.heightSize,
        ),
        settingsItemWidget(
          controller,
          onTap: () {
            controller.navigateToChangePasswordScreen();
          },
          title: Strings.changePassword.tr,
        ),
        // SizedBox(
        //   height: Dimensions.heightSize,
        // ),
        // settingsItemWidget(
        //   controller,
        //   onTap: () {
        //     controller.navigateToTwoFaSecurity();
        //   },
        //   title: Strings.twoFASecurity.tr,
        // ),
        // SizedBox(
        //   height: Dimensions.heightSize,
        // ),
        // settingsItemWidget(
        //   controller,
        //   onTap: () {
        //     controller.navigateToChangeLanguageScreen();
        //   },
        //   title: Strings.changeLanguage.tr,
        // ),
      ],
    );
  }

  settingsItemWidget(SettingsController controller,
      {required VoidCallback onTap, required String title}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: CustomColor.secondaryColor,
          borderRadius: BorderRadius.circular(Dimensions.radius * 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: Dimensions.smallTextSize,
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: CustomColor.primaryColor,
              size: Dimensions.iconSizeDefault * 1.5,
            )
          ],
        ),
      ),
    );
  }
}
