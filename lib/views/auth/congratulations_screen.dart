import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/buttons/primary_button.dart';

class CongratulationsScreen extends StatelessWidget {
  const CongratulationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return Scaffold(
      backgroundColor: CustomColor.screenBGColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: _bodyWidget(context, controller),
      ),
    );
  }

  // body widget containing all widget elements
  _bodyWidget(BuildContext context, AuthController controller) {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
        top: Dimensions.marginSize,
      ),
      child: Column(
        children: [
          SizedBox(
            height: Dimensions.heightSize * 4,
          ),
          _congratulationImage(context),
          _congratulationInfoWidget(context),
          SizedBox(
            height: Dimensions.heightSize * 3,
          ),
          _buttonWidget(context, controller),
        ],
      ),
    );
  }

  // nid and passport info
  _congratulationInfoWidget(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Dimensions.defaultPaddingSize * 2),
      child: Column(
        children: [
          SizedBox(
            height: Dimensions.heightSize * 3,
          ),
          Text(
            Strings.verifyAccount.tr,
            style: CustomStyle.commonLargeTextTitleWhite,
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          Text(
            Strings.nidPassportMessage.tr,
            style: TextStyle(
              color: CustomColor.primaryTextColor.withOpacity(0.8),
              fontSize: Dimensions.mediumTextSize,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  _congratulationImage(BuildContext context) {
    return Image.asset(Strings.congratulationScreenImagePath);
  }

  // okay Button
  _buttonWidget(BuildContext context, AuthController controller) {
    return PrimaryButton(
      title: Strings.okay.tr,
      onPressed: () {
        controller.navigateToLoginScreen();
      },
      borderColorName: CustomColor.primaryColor,
      borderWidth: 0,
    );
  }
}
