import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/custom_color.dart';
import '../utils/dimensions.dart';

class AuthNavBarWidget extends StatelessWidget {
  const AuthNavBarWidget({
    Key? key,
    required this.title,
    this.onPressed,
  }) : super(key: key);
  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: CustomColor.primaryColor,
          ),
        ),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            title,
            style: TextStyle(
              color: CustomColor.primaryColor,
              fontSize: Dimensions.smallTextSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
