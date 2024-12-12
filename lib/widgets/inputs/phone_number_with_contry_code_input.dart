import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';

class PhoneNumberWithCountryCodeInput extends StatelessWidget {
  final String? Function(String? validation)? validator;
  final bool? readOnly;
  final TextEditingController controller;

  const PhoneNumberWithCountryCodeInput({Key? key,
    this.validator,
    this.readOnly = false,
    required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    return TextFormField(
      keyboardType: TextInputType.number,
      textAlign: TextAlign.left,
      readOnly: readOnly!,
      controller: controller,
      maxLength: 10,
      validator: validator,
      style: TextStyle(
        fontSize: Dimensions.smallTextSize,
        color: CustomColor.primaryTextColor,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: CustomColor.primaryColor.withOpacity(0.4),
              width: 2.5,
            ),
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: CustomColor.primaryColor,
              width: 1,
            ),
          ),
          hintText: Strings.enterNumber,
          hintStyle: CustomStyle.hintTextStyle,
          alignLabelWithHint: true,
          contentPadding: const EdgeInsets.only(left: 0, top: 15),
          prefixIcon: Obx(() {
            return SizedBox(
              width: 36,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    authController.countryCode.value,
                    style: TextStyle(
                      fontSize: Dimensions.smallTextSize,
                      color: CustomColor.primaryTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            );
          })),
    );
  }
}
