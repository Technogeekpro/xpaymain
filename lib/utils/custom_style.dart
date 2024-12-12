import 'package:flutter/material.dart';

import 'custom_color.dart';
import 'dimensions.dart';

class CustomStyle {
  // Common
  static var commonTextTitle = TextStyle(
    color: CustomColor.primaryColor,
    fontSize: Dimensions.mediumTextSize,
    fontWeight: FontWeight.w600,
  );
  static var commonLargeTextTitleWhite = TextStyle(
    color: CustomColor.primaryTextColor,
    fontSize: Dimensions.largeTextSize,
    fontWeight: FontWeight.w600,
  );
  static var commonTextTitleWhite = TextStyle(
    color: CustomColor.primaryTextColor,
    fontSize: Dimensions.mediumTextSize,
    fontWeight: FontWeight.w600,
  );
  static var commonSubTextTitle = TextStyle(
    color: CustomColor.primaryTextColor,
    fontSize: Dimensions.smallestTextSize,
    fontWeight: FontWeight.w200,
  );
  static var commonTextSubTitleWhite = TextStyle(
    color: CustomColor.primaryTextColor,
    fontSize: Dimensions.smallestTextSize,
    fontWeight: FontWeight.w200,
  );
  static var commonSubTextTitleSmall = TextStyle(
    color: Colors.black.withOpacity(0.5),
    fontSize: Dimensions.smallestTextSize - 2,
    fontWeight: FontWeight.w200,
  );

  static var commonSubTextTitleBlack = TextStyle(
    fontSize: Dimensions.smallestTextSize,
    fontWeight: FontWeight.w200,
  );

  static var hintTextStyle = TextStyle(
    color: CustomColor.primaryTextColor.withOpacity(0.3),
    fontSize: Dimensions.smallestTextSize + 3,
    fontWeight: FontWeight.w200,
  );

  static var onboardTitleStyle = TextStyle(
    color: CustomColor.secondaryColor,
    fontSize: Dimensions.defaultTextSize,
    fontWeight: FontWeight.w400,
  );

// Button
  static var defaultButtonStyle = TextStyle(
    color: Colors.white,
    fontSize: Dimensions.largeTextSize,
    fontWeight: FontWeight.w500,
  );
  static var secondaryButtonTextStyle = TextStyle(
    color: CustomColor.primaryColor,
    fontSize: Dimensions.largeTextSize,
    fontWeight: FontWeight.w500,
  );
  static var secondaryButtonStyle = ElevatedButton.styleFrom(
    elevation: 0,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5))),
  );

  // Category
  static var categoryButtonStyle = ElevatedButton.styleFrom(
    elevation: 0,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5))),
  );

  // Send money
  static var sendMoneyTextStyle = TextStyle(
    color: CustomColor.primaryTextColor,
    fontSize: Dimensions.smallestTextSize,
    fontWeight: FontWeight.w600,
  );
  static var purposeUnselectedStyle = TextStyle(
    color: CustomColor.primaryTextColor.withOpacity(0.5),
    fontSize: Dimensions.mediumTextSize,
    fontWeight: FontWeight.w600,
  );
  static var sendMoneyConfirmTextStyle = TextStyle(
    color: CustomColor.primaryTextColor.withOpacity(0.5),
    fontSize: Dimensions.mediumTextSize,
    fontWeight: FontWeight.w600,
  );
  static var sendMoneyConfirmSubTextStyle = TextStyle(
    color: CustomColor.primaryTextColor.withOpacity(0.5),
    fontSize: Dimensions.smallTextSize,
    fontWeight: FontWeight.w600,
  );

  // mobile recharge

  static var purposeTextStyle = TextStyle(
    color: CustomColor.primaryTextColor.withOpacity(0.5),
    fontSize: Dimensions.smallestTextSize,
    fontWeight: FontWeight.w600,
  );

  // bank to XPay review style
  static var bankToXPayReviewStyle = TextStyle(
    color: CustomColor.primaryTextColor.withOpacity(0.5),
    fontSize: Dimensions.smallestTextSize,
    fontWeight: FontWeight.w600,
  );
  static var bankToXPayReviewStyleSub = TextStyle(
    color: CustomColor.primaryTextColor.withOpacity(0.8),
    fontSize: Dimensions.smallTextSize - 2,
    fontWeight: FontWeight.w600,
  );

  // savings section

  static var savingRules = TextStyle(
    color: CustomColor.primaryTextColor.withOpacity(0.8),
    fontSize: Dimensions.mediumTextSize,
    fontWeight: FontWeight.w400,
  );
}
