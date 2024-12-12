import 'package:flutter/material.dart';

import '../utils/custom_color.dart';
import '../utils/dimensions.dart';

class SelectPurpose extends StatelessWidget {
  const SelectPurpose({
    Key? key,
    required this.imagePath,
    required this.purpose,
  }) : super(key: key);
  final String imagePath;

  final String purpose;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height / 4.5,
      width: MediaQuery.of(context).size.width / 3.5,
      decoration: BoxDecoration(
        color: CustomColor.screenBGColor,
        borderRadius: BorderRadius.circular(Dimensions.radius),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3.5,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width / 3.5,
              height: 30,
              decoration: BoxDecoration(
                color: CustomColor.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(Dimensions.radius),
                  bottomRight: Radius.circular(Dimensions.radius),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      purpose,
                      style: TextStyle(
                        color: CustomColor.primaryTextColor.withOpacity(0.9),
                        fontSize: Dimensions.smallestTextSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
