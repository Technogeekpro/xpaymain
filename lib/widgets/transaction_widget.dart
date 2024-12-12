import 'package:flutter/material.dart';

import '../utils/custom_color.dart';
import '../utils/custom_style.dart';
import '../utils/dimensions.dart';

class TransactionsWidget extends StatelessWidget {
  const TransactionsWidget({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.dateAndTime,
    required this.phoneNumber,
    required this.transactionId,
    required this.amount,
    required this.isMoneyOut,
  }) : super(key: key);
  final String imagePath;
  final String title;
  final String dateAndTime;
  final String phoneNumber;
  final String transactionId;
  final String amount;
  final bool isMoneyOut;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 8,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultPaddingSize - 15,
        ),
        child: Row(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
              width: MediaQuery.of(context).size.height / 12,
              child: CircleAvatar(
                backgroundColor: CustomColor.secondaryColor,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: Dimensions.widthSize,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: CustomStyle.commonTextTitleWhite,
                      ),
                      Text(
                        dateAndTime,
                        style: TextStyle(
                          color: CustomColor.primaryTextColor.withOpacity(0.8),
                          fontSize: Dimensions.smallestTextSize - 2,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    phoneNumber,
                    style: TextStyle(
                      color: CustomColor.primaryTextColor.withOpacity(0.5),
                      fontSize: Dimensions.smallestTextSize,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.heightSize * 0.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Trans ID: $transactionId',
                        style: TextStyle(
                          color: CustomColor.primaryTextColor.withOpacity(0.5),
                          fontSize: Dimensions.smallestTextSize,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      Text(
                        '- \$ $amount',
                        style: TextStyle(
                          color: isMoneyOut ? Colors.red : Colors.green,
                          fontSize: Dimensions.smallestTextSize - 2,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
