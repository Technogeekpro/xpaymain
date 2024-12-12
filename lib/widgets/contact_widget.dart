import 'package:flutter/material.dart';

import '../utils/custom_color.dart';
import '../utils/custom_style.dart';
import '../utils/dimensions.dart';
import '../utils/strings.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    Key? key,
    required this.personName,
    required this.phoneNumber,
    required this.isFavorite,
  }) : super(key: key);
  final String personName;
  final String phoneNumber;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: const Color(0xFF008fff).withOpacity(0.2),
              shape: BoxShape.circle),
          child: Image.asset(Strings.contactIconPath),
        ),
        SizedBox(
          width: Dimensions.widthSize,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  personName,
                  style: CustomStyle.commonTextTitleWhite,
                ),
                SizedBox(
                  width: Dimensions.widthSize * 0.5,
                ),
                isFavorite
                    ? Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: Dimensions.iconSizeDefault,
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            SizedBox(
              height: Dimensions.heightSize * 0.2,
            ),
            Text(
              phoneNumber,
              style: TextStyle(
                color: CustomColor.primaryTextColor.withOpacity(0.5),
                fontSize: Dimensions.smallestTextSize,
                fontWeight: FontWeight.w200,
              ),
            ),
          ],
        )
      ],
    );
  }
}
