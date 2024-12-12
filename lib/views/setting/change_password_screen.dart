import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:xpay/controller/settings_controller.dart';
import 'package:xpay/views/auth/user_provider.dart';
import 'package:xpay/widgets/buttons/primary_button.dart';
import 'package:xpay/widgets/inputs/text_field_input_widget.dart';
import 'package:xpay/widgets/inputs/text_label_widget.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../utils/utils.dart'; // Assume Utils class handles dialogs
import '../../widgets/primary_appbar.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  ChangePasswordScreenState createState() => ChangePasswordScreenState();
}

class ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final formKey = GlobalKey<FormState>();
  late final UserProvider _userProvider;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: CustomColor.screenBGColor,
      appBar: PrimaryAppBar(
        appbarSize: Dimensions.defaultAppBarHeight,
        toolbarHeight: Dimensions.defaultAppBarHeight,
        title: Text(
          Strings.changePassword.tr,
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
        child: _bodyWidget(context, controller),
      ),
    );
  }

  // Body widget containing all widget elements
  _bodyWidget(BuildContext context, SettingsController controller) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: Dimensions.marginSize,
          right: Dimensions.marginSize,
          top: Dimensions.marginSize,
        ),
        child: Column(
          children: [
            _passwordInputsWidget(context, controller),
            SizedBox(
              height: Dimensions.heightSize * 2,
            ),
            _buttonWidget(context, controller)
          ],
        ),
      ),
    );
  }

  // Password input widgets
  _passwordInputsWidget(BuildContext context, SettingsController controller) {
    return Container(
      padding: EdgeInsets.all(Dimensions.defaultPaddingSize),
      decoration: BoxDecoration(
        color: CustomColor.secondaryColor,
        borderRadius: BorderRadius.circular(Dimensions.radius),
      ),
      child: _resetPasswordInputWidget(context, controller),
    );
  }

  // Form with password input fields
  _resetPasswordInputWidget(
      BuildContext context, SettingsController controller) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextLabelWidget(text: Strings.oldPassword.tr),
          TextFieldInputWidget(
            controller: controller.oldPasswordController,
            hintText: Strings.oldPasswordHint.tr,
            borderColor: CustomColor.primaryColor,
            color: CustomColor.secondaryColor,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your old password';
              }
              return null;
            },
          ),
          SizedBox(height: Dimensions.heightSize),
          TextLabelWidget(text: Strings.newPassword.tr),
          TextFieldInputWidget(
            controller: controller.newPasswordController,
            hintText: Strings.enterPasswordHint.tr,
            borderColor: CustomColor.primaryColor,
            color: CustomColor.secondaryColor,
            validator: (value) {
              if (value == null || value.length < 6) {
                return 'Password must be at least 6 characters long';
              }
              return null;
            },
          ),
          SizedBox(height: Dimensions.heightSize),
          TextLabelWidget(text: Strings.confirmNewPassword.tr),
          TextFieldInputWidget(
            controller: controller.confirmController,
            hintText: Strings.confirmNewPassword.tr,
            borderColor: CustomColor.primaryColor,
            color: CustomColor.secondaryColor,
            validator: (value) {
              if (value != controller.newPasswordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  // Button widget to trigger password change
  _buttonWidget(BuildContext context, SettingsController controller) {
    return PrimaryButton(
      title: Strings.changePassword,
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          Utils.showLoadingDialog(context);
          try {
            await _userProvider.changePassword(controller);
            if (context.mounted) {
              Navigator.pop(context);
              Utils.showDialogMessage(
                  context, 'Success', 'Password updated successfully!');
            }
          } catch (e) {
            if (context.mounted) {
              Navigator.pop(context);
              Utils.showDialogMessage(
                  context, 'Error', 'Failed to update password: $e');
            }
          }
        }
      },
      borderColorName: CustomColor.primaryColor,
      borderWidth: 0,
    );
  }

  @override
  void initState() {
    super.initState();
    _userProvider = Provider.of<UserProvider>(context, listen: false);
  }
}
