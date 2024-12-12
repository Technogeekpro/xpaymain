import 'package:flutter/material.dart';

import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.borderColorName,
    required this.borderWidth,
  }) : super(key: key);
  final String title;
  final VoidCallback onPressed;
  final Color borderColorName;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.buttonHeight,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColor.screenBGColor,
          side: BorderSide(
            width: borderWidth,
            color: borderColorName,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: CustomColor.primaryColor,
            fontSize: Dimensions.mediumTextSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
