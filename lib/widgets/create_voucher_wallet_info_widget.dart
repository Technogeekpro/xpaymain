import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/custom_color.dart';
import '../utils/dimensions.dart';
import '../utils/strings.dart';

class CreateVoucherWalletInfoWidget extends StatelessWidget {
  const CreateVoucherWalletInfoWidget({
    Key? key,
    required this.voucherAmount,
    required this.wallet,
    required this.totalCharge,
    required this.payableAmount,
  }) : super(key: key);

  final String voucherAmount;
  final String wallet;

  final String totalCharge;
  final String payableAmount;

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
                      Strings.voucherAmount.tr,
                      style: TextStyle(
                        color: CustomColor.primaryTextColor.withOpacity(0.5),
                        fontSize: Dimensions.smallestTextSize,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    Text(
                      voucherAmount,
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
                      Strings.payableAmount.tr,
                      style: TextStyle(
                        color: CustomColor.primaryTextColor.withOpacity(0.5),
                        fontSize: Dimensions.smallestTextSize,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    Text(
                      payableAmount,
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
