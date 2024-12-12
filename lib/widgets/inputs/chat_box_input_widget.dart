import 'package:flutter/material.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';

class ChatBoxInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final Color? color;
  final double borderWidth;
  final Color borderColor;
  final Color focusedBorderColor;
  final VoidCallback? onPressed;
  final IconData? icon;
  final double? iconSize;

  const ChatBoxInputWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.readOnly = false,
    this.borderWidth = 1,
    this.color = Colors.white,
    this.focusedBorderColor = CustomColor.primaryColor,
    this.borderColor = CustomColor.primaryColor,
    this.onPressed,
    this.icon = Icons.edit,
    this.iconSize = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Dimensions.heightSize * 0.5,
        ),
        Container(
          height: 45,
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          width: double.infinity,
          child: TextFormField(
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
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
                borderSide: BorderSide(color: borderColor, width: 0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
                borderSide: BorderSide(color: borderColor, width: 0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
                borderSide:
                    BorderSide(color: focusedBorderColor, width: borderWidth),
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
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              hintText: hintText,
              hintStyle: CustomStyle.hintTextStyle,
              suffixIcon: IconButton(
                icon: Icon(
                  icon,
                  size: iconSize,
                  color: Colors.white.withOpacity(0.5),
                ),
                color: CustomColor.primaryColor,
                onPressed: onPressed,
              ),
            ),
          ),
        )
        // CustomSize.heightBetween()
      ],
    );
  }
}
