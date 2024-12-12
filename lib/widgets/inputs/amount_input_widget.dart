import 'package:flutter/material.dart';
import 'package:xpay/utils/custom_style.dart';

import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';

class AmountInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final Color? color;
  final double focusedBorderWidth;
  final String? Function(String? validation)? validator;
  final double enabledBorderWidth;
  final Color borderColor;
  final Widget? suffixIcon;
  final VoidCallback? onTap;

  const AmountInputWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.number,
    this.readOnly = false,
    this.validator,
    this.focusedBorderWidth = 1,
    this.enabledBorderWidth = 1.5,
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
          height: Dimensions.inputBoxHeight,
          width: double.infinity,
          child: TextFormField(
            style: TextStyle(
              color: CustomColor.primaryTextColor,
              fontSize: Dimensions.mediumTextSize,
            ),
            readOnly: readOnly!,
            // style: CustomStyle.textStyle,
            controller: controller,
            keyboardType: keyboardType,
            validator: validator,
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
                  left: 15, right: 16, top: 14, bottom: 10),
              hintText: hintText,
              hintStyle: CustomStyle.hintTextStyle,
              suffixIcon: suffixIcon == null
                  ? const SizedBox.shrink()
                  : GestureDetector(
                      onTap: onTap,
                      child: suffixIcon,
                    ),
            ),
          ),
        )
        // CustomSize.heightBetween()
      ],
    );
  }
}
