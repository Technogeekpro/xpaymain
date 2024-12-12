import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/custom_color.dart';
import '../utils/dimensions.dart';
import '../utils/strings.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.65,
      margin:
          EdgeInsets.only(top: Dimensions.marginSize - 10, right: 2, left: 2),
      padding:
          EdgeInsets.symmetric(vertical: Dimensions.defaultPaddingSize * 0.4),
      decoration: BoxDecoration(
        color: CustomColor.sliderColor,
        borderRadius: BorderRadius.circular(Dimensions.radius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                Strings.currentBalance.tr,
                style: TextStyle(
                  color: CustomColor.primaryTextColor.withOpacity(0.5),
                  fontSize: Dimensions.smallestTextSize,
                  fontWeight: FontWeight.w200,
                ),
              ),
              SizedBox(
                width: Dimensions.widthSize,
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.defaultPaddingSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'USD',
                    style: TextStyle(
                      color: CustomColor.primaryTextColor,
                      fontSize: Dimensions.smallTextSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.heightSize * 0.2,
                  ),
                  Text(
                    'United States Dollar',
                    style: TextStyle(
                      color: CustomColor.primaryTextColor.withOpacity(0.5),
                      fontSize: Dimensions.smallestTextSize,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.heightSize,
                  ),
                  Text(
                    '\$ 1000.00',
                    style: TextStyle(
                      color: CustomColor.primaryTextColor,
                      fontSize: Dimensions.largeTextSize * 1.5,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
