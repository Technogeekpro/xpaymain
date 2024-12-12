import 'package:flutter/material.dart';

import '../utils/custom_color.dart';
import '../utils/custom_style.dart';
import '../utils/dimensions.dart';
import '../utils/strings.dart';

class CardItemWidget extends StatelessWidget {
  const CardItemWidget(
      {Key? key,
      required this.cardNumber,
      required this.isSelected,
      this.onTap})
      : super(key: key);

  final String cardNumber;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                Strings.bankCardImagePath,
              ),
              Text(
                cardNumber,
                style: CustomStyle.commonTextTitleWhite,
              ),
            ],
          ),
          isSelected
              ? Icon(
                  Icons.check_circle,
                  color: CustomColor.primaryColor,
                  size: Dimensions.iconSizeDefault,
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
