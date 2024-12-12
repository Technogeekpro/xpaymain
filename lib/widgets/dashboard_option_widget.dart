import 'package:flutter/material.dart';

import '../utils/custom_style.dart';
import '../utils/dimensions.dart';

class DashboardOptionWidget extends StatelessWidget {
  const DashboardOptionWidget({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final String imagePath;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Image.asset(imagePath),
            SizedBox(
              height: Dimensions.heightSize * 0.5,
            ),
            Text(
              title,
              style: CustomStyle.commonSubTextTitle,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
