import 'package:flutter/material.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';

class TextFieldInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final String? Function(String? validation)? validator;
  final bool? readOnly;
  final Color? color;
  final double focusedBorderWidth;
  final double enabledBorderWidth;
  final Color borderColor;
  final IconData? suffixIcon;
  final VoidCallback? onTap;

  const TextFieldInputWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.validator,
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
          width: double.infinity,
          child: TextFormField(
            style: TextStyle(
              color: CustomColor.primaryTextColor,
              fontSize: Dimensions.smallTextSize,
              fontWeight: FontWeight.w400,
            ),
            readOnly: readOnly!,
            // style: CustomStyle.textStyle,
            controller: controller,
            keyboardType: keyboardType,
            validator: validator,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
                borderSide: BorderSide(
                    color: CustomColor.primaryColor.withOpacity(0.4),
                    width: enabledBorderWidth),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: CustomColor.primaryColor, width: focusedBorderWidth),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
                borderSide: const BorderSide(color: Colors.red, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
                borderSide: const BorderSide(color: Colors.red, width: 1),
              ),
              filled: true,
              fillColor: color,
              contentPadding:
                  const EdgeInsets.only(left: 0, right: 0, top: 14, bottom: 10),
              hintText: hintText,
              hintStyle: CustomStyle.hintTextStyle,
              suffixIcon: suffixIcon == null
                  ? const SizedBox.shrink()
                  : GestureDetector(
                      onTap: onTap,
                      child: Icon(
                        suffixIcon,
                        color: CustomColor.primaryColor,
                        size: Dimensions.iconSizeDefault * 1.4,
                      ),
                    ),
            ),
          ),
        )
        // CustomSize.heightBetween()
      ],
    );
  }
}
