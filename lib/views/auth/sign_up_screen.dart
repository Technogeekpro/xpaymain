import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:xpay/controller/auth_controller.dart';
import 'package:xpay/data/user_model.dart';
import 'package:xpay/utils/utils.dart';
import 'package:xpay/widgets/buttons/primary_button.dart';
import 'package:xpay/widgets/inputs/phone_number_with_contry_code_input.dart';
import 'package:xpay/widgets/inputs/text_field_input_widget.dart';
import 'package:xpay/widgets/inputs/text_label_widget.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/auth_nav_bar.dart';
import '../../widgets/inputs/country_picker_input_widget.dart';
import '../../widgets/inputs/pin_and_password_input_widget.dart';
import 'login_vm.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  final companyFormKey = GlobalKey<FormState>();

  late final LoginViewModel? _loginViewModel;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return Scaffold(
      backgroundColor: CustomColor.screenBGColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: Dimensions.marginSize,
                right: Dimensions.marginSize,
                top: Dimensions.marginSize,
              ),
              child: Column(
                children: [
                  _naveBarWidget(context, controller),
                  _registerInfoWidget(context),
                  SizedBox(
                    height: Dimensions.heightSize,
                  ),
                ],
              ),
            ),

            // Column(
            //   children: [
            //     SizedBox(
            //       height: MediaQuery.of(context).size.height * 0.12,
            //       width: MediaQuery.of(context).size.width,
            //       child: TabBar(
            //         controller: controller.tabController,
            //         unselectedLabelColor: Colors.white.withOpacity(0.5),
            //         labelColor: Colors.white,
            //         indicatorColor: Colors.transparent,
            //         tabs: [
            //           Container(
            //             width: MediaQuery.of(context).size.width * 0.50,
            //             // height: MediaQuery.of(context).size.height * 0.30,
            //             padding:
            //                 EdgeInsets.all(Dimensions.defaultPaddingSize * 0.5),
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(Dimensions.radius),
            //               color: CustomColor.secondaryColor,
            //             ),
            //             child: Tab(
            //               icon: Icon(Icons.person),
            //               text: Strings.personalAccount.tr,
            //             ),
            //           ),
            //           Container(
            //             width: MediaQuery.of(context).size.width * 0.50,
            //             padding:
            //                 EdgeInsets.all(Dimensions.defaultPaddingSize * 0.5),
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(Dimensions.radius),
            //               color: CustomColor.secondaryColor,
            //             ),
            //             child: Tab(
            //               icon: Icon(Icons.business_center),
            //               text: Strings.companyAccount.tr,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            // tab views
            _registerInputs(context, controller),
            // Container(
            //   padding: EdgeInsets.only(
            //     left: Dimensions.marginSize * 0.6,
            //     right: Dimensions.marginSize * 0.6,
            //   ),
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.height * 0.65,
            //   child: TabBarView(
            //     controller: controller.tabController,
            //     children: [
            //       ListView(
            //         shrinkWrap: true,
            //         physics: const BouncingScrollPhysics(),
            //         children: [
            //
            //         ],
            //       ),
            //       ListView(
            //         shrinkWrap: true,
            //         physics: const BouncingScrollPhysics(),
            //         children: [
            //         //  _companyAccountInputs(context, controller),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  // body widget containing all widget elements
  _bodyWidget(BuildContext context, AuthController controller) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: Dimensions.marginSize,
            right: Dimensions.marginSize,
            top: Dimensions.marginSize,
          ),
          child: Column(
            children: [
              _naveBarWidget(context, controller),
              _registerInfoWidget(context),
              SizedBox(
                height: Dimensions.heightSize,
              ),
            ],
          ),
        ),

        // Column(
        //   children: [
        //     SizedBox(
        //       height: MediaQuery.of(context).size.height * 0.12,
        //       width: MediaQuery.of(context).size.width,
        //       child: TabBar(
        //         controller: controller.tabController,
        //         unselectedLabelColor: Colors.white.withOpacity(0.5),
        //         labelColor: Colors.white,
        //         indicatorColor: Colors.transparent,
        //         tabs: [
        //           Container(
        //             width: MediaQuery.of(context).size.width * 0.50,
        //             // height: MediaQuery.of(context).size.height * 0.30,
        //             padding:
        //                 EdgeInsets.all(Dimensions.defaultPaddingSize * 0.5),
        //             decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(Dimensions.radius),
        //               color: CustomColor.secondaryColor,
        //             ),
        //             child: Tab(
        //               icon: Icon(Icons.person),
        //               text: Strings.personalAccount.tr,
        //             ),
        //           ),
        //           Container(
        //             width: MediaQuery.of(context).size.width * 0.50,
        //             padding:
        //                 EdgeInsets.all(Dimensions.defaultPaddingSize * 0.5),
        //             decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(Dimensions.radius),
        //               color: CustomColor.secondaryColor,
        //             ),
        //             child: Tab(
        //               icon: Icon(Icons.business_center),
        //               text: Strings.companyAccount.tr,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        // tab views
        _registerInputs(context, controller),
        // Container(
        //   padding: EdgeInsets.only(
        //     left: Dimensions.marginSize * 0.6,
        //     right: Dimensions.marginSize * 0.6,
        //   ),
        //   width: MediaQuery.of(context).size.width,
        //   height: MediaQuery.of(context).size.height * 0.65,
        //   child: TabBarView(
        //     controller: controller.tabController,
        //     children: [
        //       ListView(
        //         shrinkWrap: true,
        //         physics: const BouncingScrollPhysics(),
        //         children: [
        //
        //         ],
        //       ),
        //       ListView(
        //         shrinkWrap: true,
        //         physics: const BouncingScrollPhysics(),
        //         children: [
        //         //  _companyAccountInputs(context, controller),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }

  // navigation  bar widget
  _naveBarWidget(BuildContext context, AuthController controller) {
    return AuthNavBarWidget(
      title: Strings.signIn.tr,
      onPressed: () {
        controller.navigateToLoginScreen();
      },
    );
  }

  // Register input and info
  _registerInputs(BuildContext context, AuthController controller) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(Dimensions.defaultPaddingSize),
          decoration: BoxDecoration(
            color: CustomColor.secondaryColor,
            borderRadius: BorderRadius.circular(Dimensions.radius),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _personalAccountInputWidget(context, controller),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              _checkBoxWidget(context, controller),
            ],
          ),
        ),
        SizedBox(
          height: Dimensions.heightSize,
        ),
        _buttonWidget(context, controller, Strings.user),
      ],
    );
  }

  // Register input and info
  _companyAccountInputs(BuildContext context, AuthController controller) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(Dimensions.defaultPaddingSize),
          decoration: BoxDecoration(
            color: CustomColor.secondaryColor,
            borderRadius: BorderRadius.circular(Dimensions.radius),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _companyAccountInputWidget(context, controller),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              _checkBoxWidget(context, controller),
            ],
          ),
        ),
        SizedBox(
          height: Dimensions.heightSize,
        ),
        _buttonWidget(context, controller, Strings.company),
      ],
    );
  }

  // register info
  _registerInfoWidget(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Dimensions.defaultPaddingSize * 2),
      child: Column(
        children: [
          Text(
            Strings.signUp.tr,
            style: CustomStyle.commonLargeTextTitleWhite,
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          Text(
            Strings.registerMessage.tr,
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

  // register inputs
  _personalAccountInputWidget(BuildContext context, AuthController controller) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextLabelWidget(text: Strings.firstName.tr),
          TextFieldInputWidget(
            validator: RequiredValidator(errorText: 'Please enter first name'),
            keyboardType: TextInputType.name,
            controller: controller.firstNameAuthController,
            hintText: Strings.firstNameHint.tr,
            borderColor: CustomColor.primaryColor,
            color: CustomColor.secondaryColor,
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          TextLabelWidget(text: Strings.lastName.tr),
          TextFieldInputWidget(
            validator: RequiredValidator(errorText: 'Please enter last name'),
            controller: controller.lastNameAuthController,
            keyboardType: TextInputType.name,
            hintText: Strings.lastNameHint.tr,
            borderColor: CustomColor.primaryColor,
            color: CustomColor.secondaryColor,
          ),
          Column(
            children: [
              SizedBox(
                height: Dimensions.heightSize,
              ),
              TextLabelWidget(text: Strings.country.tr),
              ProfileCountryCodePickerWidget(
                hintText: 'Select Country',
                controller: controller.countryController,
              ),
              Divider(
                thickness: 1.5,
                color: CustomColor.primaryColor.withOpacity(0.5),
              ),
            ],
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          TextLabelWidget(text: Strings.mobile.tr),
          PhoneNumberWithCountryCodeInput(
            validator:
                RequiredValidator(errorText: 'Please enter mobile number'),
            controller: controller.phoneNumberAuthController,
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          TextLabelWidget(text: Strings.emailAddress.tr),
          TextFieldInputWidget(
            validator: MultiValidator([
              RequiredValidator(errorText: 'Please enter an email address'),
              EmailValidator(errorText: 'Please enter a valid email address')
            ]),
            keyboardType: TextInputType.emailAddress,
            controller: controller.emailAuthController,
            hintText: Strings.enterEmailHint.tr,
            borderColor: CustomColor.primaryColor,
            color: CustomColor.secondaryColor,
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          TextLabelWidget(text: Strings.password.tr),
          PinAndPasswordInputWidget(
            validator: MultiValidator([
              RequiredValidator(errorText: 'Please enter a password'),
              LengthRangeValidator(
                  min: 6,
                  max: 16,
                  errorText:
                      'Password should be minimum 6 and max 16 characters')
            ]),
            hintText: Strings.password.tr,
            controller: controller.passwordController,
            borderColor: CustomColor.primaryColor,
            color: CustomColor.secondaryColor,
            keyboardType: TextInputType.visiblePassword,
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          TextLabelWidget(text: Strings.confirmPassword.tr),
          PinAndPasswordInputWidget(
            validator: MultiValidator([
              RequiredValidator(errorText: 'Please enter a password'),
              LengthRangeValidator(
                  min: 6,
                  max: 16,
                  errorText:
                      'Password should be minimum 6 and max 16 characters')
            ]),
            hintText: Strings.confirmPasswordHint.tr,
            controller: controller.confirmPasswordController,
            borderColor: CustomColor.primaryColor,
            color: CustomColor.secondaryColor,
            keyboardType: TextInputType.visiblePassword,
          )
        ],
      ),
    );
  }

  _companyAccountInputWidget(BuildContext context, AuthController controller) {
    return Form(
      key: companyFormKey,
      child: Column(
        children: [
          TextLabelWidget(text: Strings.legalNameOfCompany.tr),
          TextFieldInputWidget(
            validator: RequiredValidator(errorText: 'Enter a name'),
            keyboardType: TextInputType.name,
            controller: controller.legalNameOfCompanyController,
            hintText: Strings.legalNameOfCompanyHint.tr,
            borderColor: CustomColor.primaryColor,
            color: CustomColor.secondaryColor,
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          TextLabelWidget(text: Strings.representativeFirstName.tr),
          TextFieldInputWidget(
            validator: RequiredValidator(errorText: 'Enter a first name'),
            controller: controller.representativeFirstNameController,
            hintText: Strings.firstNameHint.tr,
            borderColor: CustomColor.primaryColor,
            color: CustomColor.secondaryColor,
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          TextLabelWidget(text: Strings.representativeLastName.tr),
          TextFieldInputWidget(
            controller: controller.representativeLastNameController,
            validator: RequiredValidator(errorText: 'Enter a last name'),
            hintText: Strings.lastNameHint.tr,
            borderColor: CustomColor.primaryColor,
            color: CustomColor.secondaryColor,
          ),
          Column(
            children: [
              SizedBox(
                height: Dimensions.heightSize,
              ),
              TextLabelWidget(text: Strings.country.tr),
              ProfileCountryCodePickerWidget(
                hintText: 'Select Country',
                controller: controller.countryController,
              ),
              Divider(
                thickness: 1.5,
                color: CustomColor.primaryColor.withOpacity(0.5),
              ),
            ],
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          TextLabelWidget(text: Strings.mobile.tr),
          PhoneNumberWithCountryCodeInput(
            validator:
                RequiredValidator(errorText: 'Please enter mobile number'),
            controller: controller.companyPhoneNumberAuthController,
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          TextLabelWidget(text: Strings.emailAddress.tr),
          TextFieldInputWidget(
            controller: controller.companyEmailAuthController,
            validator: MultiValidator([
              RequiredValidator(errorText: 'Please enter an email address'),
              EmailValidator(errorText: 'Please enter a valid email address')
            ]),
            hintText: Strings.enterEmailHint.tr,
            borderColor: CustomColor.primaryColor,
            color: CustomColor.secondaryColor,
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          TextLabelWidget(text: Strings.password.tr),
          PinAndPasswordInputWidget(
            validator: MultiValidator([
              RequiredValidator(errorText: 'Please enter a password'),
              LengthRangeValidator(
                  min: 6,
                  max: 16,
                  errorText:
                      'Password should be minimum 6 and max 16 characters')
            ]),
            hintText: Strings.password.tr,
            controller: controller.companyPasswordController,
            borderColor: CustomColor.primaryColor,
            color: CustomColor.secondaryColor,
            keyboardType: TextInputType.visiblePassword,
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          TextLabelWidget(text: Strings.confirmPassword.tr),
          PinAndPasswordInputWidget(
            validator: MultiValidator([
              RequiredValidator(errorText: 'Please enter a password'),
              LengthRangeValidator(
                  min: 6,
                  max: 16,
                  errorText:
                      'Password should be minimum 6 and max 16 characters')
            ]),
            hintText: Strings.confirmPasswordHint.tr,
            controller: controller.companyConfirmPasswordController,
            borderColor: CustomColor.primaryColor,
            color: CustomColor.secondaryColor,
            keyboardType: TextInputType.visiblePassword,
          ),
        ],
      ),
    );
  }

  // Sign up Button
  _buttonWidget(
      BuildContext context, AuthController controller, String accountType) {
    return PrimaryButton(
      title: Strings.signUp.tr,
      onPressed: () async {
        UserModel user = UserModel(
            userId: '',
            companyName: controller.tabController.index == 1
                ? controller.legalNameOfCompanyController.text.trim()
                : '',
            representativeFirstName: controller.tabController.index == 1
                ? controller.representativeFirstNameController.text.trim()
                : '',
            representativeLastName: controller.tabController.index == 1
                ? controller.representativeLastNameController.text.trim()
                : '',
            firstName: controller.firstNameAuthController.text.trim(),
            lastName: controller.lastNameAuthController.text.trim(),
            country: controller.countryController.text.trim().isNotEmpty
                ? controller.countryController.text.trim()
                : 'United States',
            emailAddress: controller.tabController.index == 1
                ? controller.companyEmailAuthController.text.trim()
                : controller.emailAuthController.text.trim().toLowerCase(),
            mobile: controller.tabController.index == 1
                ? controller.companyPhoneNumberAuthController.text.trim()
                : controller.phoneNumberAuthController.text.trim(),
            password: controller.tabController.index == 1
                ? controller.companyPasswordController.text.trim()
                : controller.passwordController.text.trim(),
            accountType: accountType,
            walletBalances: {'USD': 0.0},
            profilePhoto: '',
            zipCode: '',
            state: '',
            city: '',
            address: '');

        if (accountType == Strings.user) {
          if (formKey.currentState!.validate()) {
            await _handleSignUp(context, user, controller);
          }
        } else {
          if (companyFormKey.currentState!.validate()) {
            await _handleSignUp(context, user, controller);
          }
        }
      },
      borderColorName: CustomColor.primaryColor,
    );
  }

  _checkBoxWidget(BuildContext context, AuthController controller) => Obx(
        () => Row(
          children: [
            SizedBox(
              width: 25,
              child: Checkbox(
                side: BorderSide(
                  color: CustomColor.primaryColor.withOpacity(0.5),
                  width: 1.5,
                ),
                fillColor: WidgetStateProperty.all(CustomColor.primaryColor),
                value: controller.isChecked.value,
                shape: const RoundedRectangleBorder(),
                onChanged: (value) {
                  controller.isChecked.value = !controller.isChecked.value;
                },
              ),
            ),
            SizedBox(
              width: Dimensions.widthSize * 0.5,
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: Strings.iAgree.tr,
                  style: TextStyle(
                    color: CustomColor.primaryTextColor,
                    fontSize: Dimensions.smallestTextSize,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async => await Utils.openUrl(
                            'https://www.getdigitalpayments.com/privacy-policy'),
                      text: Strings.termsOfCheckBox.tr,
                      style: TextStyle(
                        color: CustomColor.primaryColor,
                        fontSize: Dimensions.smallestTextSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );

  @override
  void initState() {
    super.initState();
    _loginViewModel = Provider.of<LoginViewModel>(context, listen: false);
  }

  Future<void> _handleSignUp(
      BuildContext context, UserModel user, AuthController controller) async {
    if (controller.isChecked.value) {
      try {
        Utils.showLoadingDialog(context);
        final errorMessage = await _loginViewModel?.signUp(user);

        if (errorMessage != null && errorMessage.isNotEmpty) {
          Navigator.pop(context);
          Utils.showDialogMessage(context, 'Sign Up Failed', errorMessage);
        } else {
          Navigator.pop(context);
          Utils.showDialogMessage(
              context, 'Registered', 'You are now registered');
        }
      } catch (ex) {
        Navigator.pop(context);
        Utils.showDialogMessage(
            context, 'Sign Up Failed', 'Failed to sign up. $ex');
      }
    } else {
      Utils.showDialogMessage(context, 'Please acknowledge',
          'Please accept the Terms & Conditions before signing up');
    }
  }
}
