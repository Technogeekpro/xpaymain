import 'package:flutter/material.dart';

import '../utils/custom_color.dart';
import '../utils/dimensions.dart';

class TransactionsItemWidget extends StatelessWidget {
  const TransactionsItemWidget({
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
      child: Row(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
            width: MediaQuery.of(context).size.height / 12,
            child: CircleAvatar(
              backgroundColor: CustomColor.primaryColor.withOpacity(0.5),
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
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          color: CustomColor.primaryTextColor,
                          fontSize: Dimensions.smallTextSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      dateAndTime,
                      style: TextStyle(
                        color: CustomColor.primaryTextColor.withOpacity(0.8),
                        fontSize: Dimensions.smallestTextSize * 0.8,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimensions.heightSize * 0.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Trans ID: $transactionId',
                        style: TextStyle(
                          color: CustomColor.primaryTextColor.withOpacity(0.5),
                          fontSize: Dimensions.smallestTextSize * 0.8,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                    Text(
                      '- \$ $amount',
                      style: TextStyle(
                        color: isMoneyOut ? Colors.red : Colors.green,
                        fontSize: Dimensions.smallestTextSize * 0.8,
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
    );
  }
}
