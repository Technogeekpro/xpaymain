import 'package:flutter/material.dart';

import '../utils/custom_color.dart';
import '../utils/dimensions.dart';

// transaction card widget
class InvoiceItemWidget extends StatelessWidget {
  const InvoiceItemWidget({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.dateAndTime,
    required this.subTitle,
    required this.isPaid,
  }) : super(key: key);
  final String imagePath;
  final String title;
  final String dateAndTime;

  final String subTitle;

  final bool isPaid;

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
                        style: TextStyle(
                          color: CustomColor.primaryTextColor,
                          fontSize: Dimensions.mediumTextSize * 0.8,
                          fontWeight: FontWeight.w600,
                        ),
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
                  SizedBox(
                    height: Dimensions.heightSize * 0.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        subTitle,
                        style: TextStyle(
                          color: CustomColor.primaryTextColor.withOpacity(0.5),
                          fontSize: Dimensions.smallestTextSize,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                        width: 80,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(
                              isPaid ? Colors.red : const Color(0xff13c366),
                            ),
                            shape: WidgetStateProperty.all<
                                ContinuousRectangleBorder>(
                              ContinuousRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius),
                              ),
                            ),
                          ),
                          child: Text(
                            isPaid ? 'Paid' : 'Unpaid',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Dimensions.smallestTextSize * 0.8),
                          ),
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
