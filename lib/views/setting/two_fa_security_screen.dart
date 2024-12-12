import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpay/routes/routes.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/copy_id_widget.dart';
import '../../widgets/primary_appbar.dart';

class TwoFaSecurity extends StatelessWidget {
  TwoFaSecurity({Key? key}) : super(key: key);

  final copyIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.screenBGColor,
      appBar: PrimaryAppBar(
        appbarSize: Dimensions.defaultAppBarHeight,
        toolbarHeight: Dimensions.defaultAppBarHeight,
        title: Text(
          Strings.twoFASecurity.tr,
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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: CustomColor.secondaryColor,
          borderRadius: BorderRadius.circular(Dimensions.radius * 2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Strings.myQrCodeImagePath),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CopyIdInputWidget(
              hintText: 'TYD452KKJX556SKSIPOHX5645DK',
              controller: copyIdController,
              color: CustomColor.secondaryColor,
              suffixIcon: _copyIdButton(context),
            ),
          ),
        ],
      ),
    );
  }

  //  Button widget
  _buttonWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: PrimaryButton(
        title: Strings.enable.tr,
        onPressed: () {
          Get.toNamed(Routes.navigationScreen);
        },
        borderColorName: CustomColor.primaryColor,
      ),
    );
  }

  _copyIdButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.20,
      decoration: BoxDecoration(
        color: CustomColor.primaryColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(Dimensions.radius),
          bottomRight: Radius.circular(Dimensions.radius),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.content_copy,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
