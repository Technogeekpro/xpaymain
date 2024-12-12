import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpay/controller/welcome_controller.dart';

import '../utils/custom_color.dart';
import '../utils/custom_style.dart';
import '../utils/dimensions.dart';
import '../utils/strings.dart';
import '../widgets/buttons/primary_button.dart';
import '../widgets/buttons/secondary_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WelcomeController());
    return Scaffold(
      backgroundColor: CustomColor.screenBGColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: _bodyWidget(context, controller),
      ),
    );
  }

  Widget _bodyWidget(BuildContext context, WelcomeController controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _logoAndTitleWidget(context),
        SizedBox(
          height: Dimensions.heightSize * 4,
        ),
        _buttonWidget(context, controller),
      ],
    );
  }

  Widget _logoAndTitleWidget(BuildContext context) {
    return Column(
      children: [
        Image.asset(Strings.splashScreenImagePath),
        SizedBox(
          height: Dimensions.heightSize * 5,
        ),
        Text(
          Strings.welcomeTitle.tr,
          style: CustomStyle.commonLargeTextTitleWhite,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: Dimensions.heightSize,
        ),
        Text(
          Strings.welcomeSubTitle.tr,
          style: TextStyle(
            color: CustomColor.primaryTextColor.withOpacity(0.5),
            fontSize: Dimensions.mediumTextSize,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buttonWidget(BuildContext context, WelcomeController controller) {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Column(
        children: [
          PrimaryButton(
            title: Strings.signIn.tr,
            onPressed: () {
              controller.navigateToLogin();
            },
            borderColorName: CustomColor.primaryColor,
          ),
          SizedBox(
            height: Dimensions.heightSize * 2,
          ),
          SecondaryButton(
            title: Strings.signUp.tr,
            onPressed: () {
              controller.navigateToRegisterScreen();
            },
            borderColorName: CustomColor.primaryColor,
            borderWidth: 1.5,
          ),
        ],
      ),
    );
  }
}
