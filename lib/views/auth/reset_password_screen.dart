import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpay/controller/auth_controller.dart';
import 'package:xpay/widgets/buttons/primary_button.dart';
import 'package:xpay/widgets/inputs/text_field_input_widget.dart';
import 'package:xpay/widgets/inputs/text_label_widget.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/auth_nav_bar.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  ResetPasswordScreenState createState() => ResetPasswordScreenState();
}

class ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _controller = Get.put(AuthController());

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

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
          _resetPinWidget(context),
          SizedBox(
            height: Dimensions.heightSize * 2,
          ),
          _pinNumberInputsWidget(context),
          SizedBox(
            height: Dimensions.heightSize * 2,
          ),
          _buttonWidget(context)
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
  _pinNumberInputsWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.defaultPaddingSize),
      decoration: BoxDecoration(
        color: CustomColor.secondaryColor,
        borderRadius: BorderRadius.circular(Dimensions.radius),
      ),
      child: _resetPasswordInputWidget(context),
    );
  }

  // login info
  _resetPinWidget(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Dimensions.defaultPaddingSize * 1.5),
      child: Column(
        children: [
          Text(
            Strings.resetPassword.tr,
            style: CustomStyle.commonLargeTextTitleWhite,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          Text(
            Strings.resetPasswordMessage.tr,
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

  // login inputs
  _resetPasswordInputWidget(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextLabelWidget(text: Strings.newPassword.tr),
          TextFieldInputWidget(
            controller: newPasswordController,
            hintText: Strings.enterPasswordHint.tr,
            borderColor: CustomColor.primaryColor,
            color: CustomColor.secondaryColor,
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          TextLabelWidget(text: Strings.confirmNewPassword.tr),
          TextFieldInputWidget(
            controller: confirmPasswordController,
            hintText: Strings.confirmNewPassword.tr,
            borderColor: CustomColor.primaryColor,
            color: CustomColor.secondaryColor,
          ),
        ],
      ),
    );
  }

  // reset pin button
  _buttonWidget(BuildContext context) {
    return PrimaryButton(
      title: Strings.resetPassword.tr,
      onPressed: () {
        _successfulResetPinScreen(context);
      },
      borderColorName: CustomColor.primaryColor,
      borderWidth: 0,
    );
  }

  // successful message screen
  _successfulResetPinScreen(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                color: CustomColor.secondaryColor,
                borderRadius: BorderRadius.circular(Dimensions.radius),
              ),
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.80,
              height: MediaQuery.of(context).size.height * 0.65,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.defaultPaddingSize,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.close,
                            size: Dimensions.iconSizeDefault * 2,
                            color:
                                CustomColor.primaryTextColor.withOpacity(0.5),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: Dimensions.defaultPaddingSize),
                      child: Image.asset(Strings.successfulResetPinImagePath),
                    ),
                    SizedBox(
                      height: Dimensions.heightSize,
                    ),
                    Text(
                      Strings.passwordChangedText.tr,
                      textAlign: TextAlign.center,
                      style: CustomStyle.commonLargeTextTitleWhite,
                    ),
                    SizedBox(
                      height: Dimensions.heightSize,
                    ),
                    Text(
                      Strings.passwordChangedTextMessage.tr,
                      style: CustomStyle.commonTextSubTitleWhite,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: Dimensions.heightSize * 2,
                    ),
                    PrimaryButton(
                      title: Strings.okay.tr,
                      onPressed: () {
                        _controller.navigateToLoginScreen();
                      },
                      borderColorName: CustomColor.primaryColor,
                      borderWidth: 0,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
