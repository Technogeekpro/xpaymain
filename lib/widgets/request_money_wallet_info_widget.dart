import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/custom_color.dart';
import '../utils/dimensions.dart';
import '../utils/strings.dart';

class RequestMoneyWalletInfoWidget extends StatelessWidget {
  const RequestMoneyWalletInfoWidget({
    Key? key,
    required this.merchant,
    required this.wallet,
    required this.transferAmount,
    required this.totalCharge,
    required this.youWillGet,
    required this.note,
  }) : super(key: key);

  final String merchant;
  final String wallet;
  final String transferAmount;
  final String totalCharge;
  final String youWillGet;
  final String note;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius * 2),
          color: const Color(0xff011526)),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.wallet.tr,
                      style: TextStyle(
                        color: CustomColor.primaryTextColor.withOpacity(0.5),
                        fontSize: Dimensions.smallestTextSize,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    Text(
                      wallet,
                      style: TextStyle(
                        color: CustomColor.primaryTextColor.withOpacity(0.5),
                        fontSize: Dimensions.smallestTextSize,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1.5,
                  color: CustomColor.secondaryColor,
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.merchant.tr,
                      style: TextStyle(
                        color: CustomColor.primaryTextColor.withOpacity(0.5),
                        fontSize: Dimensions.smallestTextSize,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    Text(
                      merchant,
                      style: TextStyle(
                        color: CustomColor.primaryTextColor.withOpacity(0.5),
                        fontSize: Dimensions.smallestTextSize,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1.5,
                  color: CustomColor.secondaryColor,
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          Strings.note.tr,
                          style: TextStyle(
                            color:
                                CustomColor.primaryTextColor.withOpacity(0.5),
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
                      child: Text(
                        note,
                        style: TextStyle(
                          color: CustomColor.primaryTextColor.withOpacity(0.5),
                          fontSize: Dimensions.smallestTextSize,
                          fontWeight: FontWeight.w200,
                        ),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1.5,
                  color: CustomColor.secondaryColor,
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.transferAmount.tr,
                      style: TextStyle(
                        color: CustomColor.primaryTextColor.withOpacity(0.5),
                        fontSize: Dimensions.smallestTextSize,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    Text(
                      transferAmount,
                      style: TextStyle(
                        color: CustomColor.primaryTextColor.withOpacity(0.5),
                        fontSize: Dimensions.smallestTextSize,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1.5,
                  color: CustomColor.secondaryColor,
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.totalCharge.tr,
                      style: TextStyle(
                        color: CustomColor.primaryTextColor.withOpacity(0.5),
                        fontSize: Dimensions.smallestTextSize,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    Text(
                      totalCharge,
                      style: TextStyle(
                        color: CustomColor.primaryTextColor.withOpacity(0.5),
                        fontSize: Dimensions.smallestTextSize,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1.5,
                  color: CustomColor.secondaryColor,
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.youWillGet.tr,
                      style: TextStyle(
                        color: CustomColor.primaryTextColor.withOpacity(0.5),
                        fontSize: Dimensions.smallestTextSize,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    Text(
                      youWillGet,
                      style: TextStyle(
                        color: CustomColor.primaryTextColor.withOpacity(0.5),
                        fontSize: Dimensions.smallestTextSize,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
