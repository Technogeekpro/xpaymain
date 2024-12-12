import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xpay/utils/custom_color.dart';

import '../../controller/on_board_controller.dart';
import '../../data/onboard_model.dart';
import '../../utils/custom_style.dart';
import '../../utils/strings.dart';
import '../../widgets/onboard/onboard_content_widget.dart';
import '../../widgets/size_widget.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardController>();
    return Scaffold(
      backgroundColor: CustomColor.screenBGColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: _body(context, controller),
      ),
    );
  }

  Widget _body(BuildContext context, OnboardController controller) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.4,
              child: PageView.builder(
                onPageChanged: controller.selectedPageIndex,
                controller: controller.pageController,
                itemCount: onBoardModePages.length,
                itemBuilder: (context, index) => OnboardContentWidget(
                  title: onBoardModePages[index].title,
                  image: onBoardModePages[index].imagePath,
                ),
              ),
            ),
            Obx(() => controller.lineWidget()),
            addVerticalSpace(65.h),
            Obx(() => controller.buttonWidget()),
            addVerticalSpace(14.h),
          ],
        ),
        // Next and Gets tarted Button
        Positioned(
          top: 50,
          right: 20,
          child: Obx(
            () => controller.isFirstPage || controller.isSecondPage
                ? GestureDetector(
                    onTap: controller.pageNavigate,
                    child: Text(
                      Strings.skip.tr,
                      style: CustomStyle.commonTextTitle,
                    ),
                  )
                : Container(),
          ),
        ),
      ],
    );
  }
}
