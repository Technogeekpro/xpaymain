import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpay/routes/routes.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/primary_appbar.dart';

class MyQrCodeScreen extends StatelessWidget {
  const MyQrCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.screenBGColor,
      appBar: PrimaryAppBar(
        appbarSize: Dimensions.defaultAppBarHeight,
        toolbarHeight: Dimensions.defaultAppBarHeight,
        title: Text(
          Strings.myQRcode.tr,
          style: CustomStyle.commonTextTitleWhite,
        ),
        appBar: AppBar(),
        backgroundColor: CustomColor.primaryColor,
        autoLeading: false,
        elevation: 1,
        appbarColor: CustomColor.secondaryColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: Dimensions.iconSizeDefault * 1.4,
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: _bodyWidget(context),
      ),
    );
  }

  // body widget contain all the widgets
  _bodyWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _myQrCodeWidget(context),
        SizedBox(
          height: Dimensions.heightSize * 2,
        ),
        _buttonWidget(context),
      ],
    );
  }

  _myQrCodeWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Strings.myQrCodeImagePath),
        SizedBox(
          height: Dimensions.heightSize * 2,
        ),
        Text(
          'Download as a Image',
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: Dimensions.smallestTextSize,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }

  //  Button widget
  _buttonWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: PrimaryButton(
        title: Strings.download.tr,
        onPressed: () {
          Get.toNamed(Routes.navigationScreen);
        },
        borderColorName: CustomColor.primaryColor,
      ),
    );
  }
}
