import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpay/controller/auth_controller.dart';
import 'package:xpay/widgets/buttons/primary_button.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
/**/
import '../../widgets/auth_nav_bar.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  OtpScreenState createState() => OtpScreenState();
}

class OtpScreenState extends State<OtpScreen> {
  final formKey = GlobalKey<FormState>();
  final _controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.screenBGColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: _bodyWidget(context),
      ),
    );
  }

  // body widget containing all widget elements
  _bodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
        top: Dimensions.marginSize,
      ),
      child: Column(
        children: [
          _naveBarWidget(context),
          _otpInfo(context),
          SizedBox(
            height: Dimensions.heightSize * 2,
          ),
          _loginInputs(context),
          SizedBox(
            height: Dimensions.heightSize * 2,
          ),
          _buttonWidget(context),
        ],
      ),
    );
  }

  // navigation  bar widget
  _naveBarWidget(BuildContext context) {
    return const AuthNavBarWidget(
      title: '',
    );
  }

  // Login input and info
  _loginInputs(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultPaddingSize * 0.5, vertical: 20),
      decoration: BoxDecoration(
        color: CustomColor.secondaryColor,
        borderRadius: BorderRadius.circular(Dimensions.radius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.otp.tr,
            style: CustomStyle.commonSubTextTitle,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _otpNumberInputWidget(context),
                _otpNumberInputWidget(context),
                _otpNumberInputWidget(context),
                _otpNumberInputWidget(context),
                _otpNumberInputWidget(context),
                _otpNumberInputWidget(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Otp info
  _otpInfo(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Dimensions.defaultPaddingSize * 2),
      child: Column(
        children: [
          Text(
            Strings.otpInfo.tr,
            style: CustomStyle.commonLargeTextTitleWhite,
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          Text(
            Strings.otpInfoMessage.tr + 'demouser@gmail.com',
            style: TextStyle(
              color: CustomColor.primaryTextColor.withOpacity(0.6),
              fontSize: Dimensions.mediumTextSize,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // otp number input
  _otpNumberInputWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: Dimensions.buttonHeight,
      width: Dimensions.buttonHeight * 0.8,
      child: AspectRatio(
        aspectRatio: 0.7,
        child: TextField(
          // autofocus: true,
          onChanged: (value) {},
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: CustomColor.primaryTextColor,
            fontWeight: FontWeight.w600,
            fontSize: Dimensions.mediumTextSize,
          ),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: const Offstage(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: CustomColor.primaryColor.withOpacity(0.5),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: const BorderSide(
                color: CustomColor.primaryColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return PrimaryButton(
      title: Strings.continueText.tr,
      onPressed: () {
        _controller.navigateToResetPasswordScreen();
      },
      borderColorName: CustomColor.primaryColor,
      borderWidth: 0,
    );
  }
}
