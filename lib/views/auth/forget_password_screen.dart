import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:xpay/utils/utils.dart';
import 'package:xpay/views/auth/login_vm.dart';
import 'package:xpay/widgets/buttons/primary_button.dart';
import 'package:xpay/widgets/inputs/text_field_input_widget.dart';
import 'package:xpay/widgets/inputs/text_label_widget.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/auth_nav_bar.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  ForgetPasswordScreenState createState() => ForgetPasswordScreenState();
}

class ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  late final LoginViewModel? _loginViewModel;

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
      child: ListView(
        children: [
          _naveBarWidget(context),
          _forgetPinInfo(context),
          SizedBox(
            height: Dimensions.heightSize * 2,
          ),
          _emailInputWidget(context),
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
  _emailInputWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.defaultPaddingSize),
      decoration: BoxDecoration(
        color: CustomColor.secondaryColor,
        borderRadius: BorderRadius.circular(Dimensions.radius),
      ),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextLabelWidget(text: Strings.email.tr),
            TextFieldInputWidget(
              controller: emailController,
              validator: MultiValidator([
                RequiredValidator(errorText: 'Please enter an email address'),
                EmailValidator(errorText: 'Please enter a valid email address')
              ]),
              hintText: Strings.enterEmailHint.tr,
              borderColor: CustomColor.primaryColor,
              color: CustomColor.secondaryColor,
            ),
          ],
        ),
      ),
    );
  }

  // login info
  _forgetPinInfo(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Dimensions.defaultPaddingSize * 2),
      child: Column(
        children: [
          Text(
            Strings.forgetPassword.tr,
            style: CustomStyle.commonLargeTextTitleWhite,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Dimensions.defaultPaddingSize),
            child: Text(
              Strings.forgetPasswordMessage.tr,
              style: TextStyle(
                color: CustomColor.primaryTextColor.withOpacity(0.6),
                fontSize: Dimensions.mediumTextSize,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return PrimaryButton(
      title: Strings.continueText.tr,
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          try {
            Utils.showLoadingDialog(context);
            final errorMessage = await _loginViewModel!
                .resetPassword(emailController.text.trim());
            if (errorMessage.isNotEmpty) {
              Navigator.pop(context);
              Utils.showDialogMessage(
                  context, 'Error resetting password', errorMessage);
            } else {
              Navigator.pop(context);
              Utils.showDialogMessage(context, 'Success',
                  'If you have an account with us, we will send an email with instructions');
            }
          } catch (exception) {
            Navigator.pop(context);
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
    _loginViewModel = Provider.of<LoginViewModel>(context, listen: false);
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
