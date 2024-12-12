import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';

class ProfileCountryCodePickerWidget extends StatelessWidget {
  const ProfileCountryCodePickerWidget({
    Key? key,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    this.onChanged,
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final ValueChanged? onChanged;

  // static String? countryName =;

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: Dimensions.buttonHeight * 1.1,
          child: CountryCodePicker(
            textStyle: TextStyle(
              color: CustomColor.primaryTextColor,
              fontSize: Dimensions.smallTextSize,
              fontWeight: FontWeight.w400,
            ),
            onChanged: (value) {
              controller.text = value.name!;
              authController.countryCode.value = value.dialCode.toString();
            },
            // onChanged: onChanged,
            showOnlyCountryWhenClosed: true,
            showDropDownButton: true,
            initialSelection: 'US',
            // initialSelection: controller.text,
            backgroundColor: Colors.transparent,
            alignLeft: true,
            // onInit: (code) => {profileController.countryController.text = code?.name},
          ),
        ),
      ],
    );
  }
}
