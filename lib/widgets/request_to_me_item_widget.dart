import 'package:flutter/material.dart';

import '../utils/custom_color.dart';
import '../utils/dimensions.dart';

// transaction card widget
class RequestToMeItemWidget extends StatelessWidget {
  const RequestToMeItemWidget({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.dateAndTime,
    required this.subTitle,
    required this.isAccepted,
    required this.isRejected,
    required this.isCanceled,
    required this.onTap,
  }) : super(key: key);

  final String imagePath;
  final String title;
  final String dateAndTime;
  final String subTitle;
  final bool isAccepted;
  final bool isRejected;
  final bool isCanceled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
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
                          style: TextStyle(
                            color: CustomColor.primaryTextColor,
                            fontSize: Dimensions.mediumTextSize * 0.8,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            dateAndTime,
                            style: TextStyle(
                              color:
                                  CustomColor.primaryTextColor.withOpacity(0.8),
                              fontSize: Dimensions.smallestTextSize - 2,
                              fontWeight: FontWeight.w200,
                            ),
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
                            color:
                                CustomColor.primaryTextColor.withOpacity(0.5),
                            fontSize: Dimensions.smallestTextSize,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                isAccepted
                                    ? const Color(0xff13c366)
                                    : isRejected
                                        ? Colors.red
                                        : isCanceled
                                            ? Colors.grey
                                            : const Color(0xffff8e2c),
                              ),
                              shape: MaterialStateProperty.all<
                                  ContinuousRectangleBorder>(
                                ContinuousRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(Dimensions.radius),
                                ),
                              ),
                            ),
                            child: Text(
                              isAccepted
                                  ? 'Accepted'
                                  : isRejected
                                      ? 'Rejected'
                                      : isCanceled
                                          ? 'Canceled'
                                          : 'Pending',
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
      ),
    );
  }
}
