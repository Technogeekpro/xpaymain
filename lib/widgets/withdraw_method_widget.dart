import 'package:flutter/material.dart';

import '../utils/custom_color.dart';
import '../utils/dimensions.dart';

// transaction card widget
class WithdrawMethodItemWidget extends StatelessWidget {
  const WithdrawMethodItemWidget({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.charge,
    required this.limit,
    required this.onTap,
  }) : super(key: key);
  final String imagePath;
  final String title;
  final String limit;
  final String charge;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 8,
          child: Row(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.height * 0.20,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: CustomColor.primaryTextColor,
                        fontSize: Dimensions.mediumTextSize * 0.8,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.heightSize * 0.5,
                    ),
                    Text(
                      limit,
                      style: TextStyle(
                        color: CustomColor.primaryTextColor.withOpacity(0.5),
                        fontSize: Dimensions.smallestTextSize,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.heightSize * 0.5,
                    ),
                    Text(
                      charge,
                      style: TextStyle(
                        color: CustomColor.primaryTextColor.withOpacity(0.5),
                        fontSize: Dimensions.smallestTextSize,
                        fontWeight: FontWeight.w200,
                      ),
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
