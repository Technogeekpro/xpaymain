import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpay/utils/dimensions.dart';

import '../../utils/custom_style.dart';

class OnboardContentWidget extends StatelessWidget {
  const OnboardContentWidget({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  final String image, title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Dimensions.defaultWidgetWidth * 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              image,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.defaultWidgetHeight * 4),
            margin:
                EdgeInsets.only(bottom: Dimensions.defaultWidgetHeight * 3.5),
            child: Text(
              title.tr,
              textAlign: TextAlign.center,
              style: CustomStyle.commonTextTitleWhite,
            ),
          ),
        ],
      ),
    );
  }
}
