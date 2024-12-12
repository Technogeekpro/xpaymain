import 'package:flutter/material.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';

class MultiLineTextFieldInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final Color? color;
  final double focusedBorderWidth;
  final double enabledBorderWidth;
  final Color borderColor;
  final IconData? suffixIcon;
  final VoidCallback? onTap;

  const MultiLineTextFieldInputWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.readOnly = false,
    this.focusedBorderWidth = 1,
    this.enabledBorderWidth = 2.8,
    this.color = Colors.white,
    this.borderColor = CustomColor.primaryColor,
    this.suffixIcon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          // height: Dimensions.inputBoxHeight,
          width: double.infinity,
          child: TextFormField(
            // minLines: 1,
            maxLines: 5,
            style: TextStyle(
              color: CustomColor.primaryTextColor,
              fontSize: Dimensions.smallTextSize,
              fontWeight: FontWeight.w400,
            ),
            readOnly: readOnly!,
            // style: CustomStyle.textStyle,
            controller: controller,
            keyboardType: keyboardType,
            validator: (String? value) {
              if (value!.isEmpty) {
                return null;
              } else {
                return Strings.pleaseFillOutTheField;
              }
            },
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius),
                borderSide: BorderSide(
                    color: CustomColor.primaryColor.withOpacity(0.4),
                    width: enabledBorderWidth),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius),
                borderSide: BorderSide(
                    color: CustomColor.primaryColor, width: focusedBorderWidth),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius),
                borderSide: const BorderSide(color: Colors.red, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius),
                borderSide: const BorderSide(color: Colors.red, width: 1),
              ),
              filled: true,
              fillColor: color,
              contentPadding: const EdgeInsets.only(
                  left: 30, right: 0, top: 30, bottom: 10),
              hintText: hintText,
              hintStyle: CustomStyle.hintTextStyle,
            ),
          ),
        )
        // CustomSize.heightBetween()
      ],
    );
  }
}
