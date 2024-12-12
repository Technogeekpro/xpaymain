import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpay/controller/create_voucher_controller.dart';
import 'package:xpay/widgets/inputs/text_label_widget.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/inputs/secondary_text_input_widget.dart';
import '../../widgets/primary_appbar.dart';

class RedeemVoucherScreen extends StatelessWidget {
  RedeemVoucherScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateVoucherController());
    return Scaffold(
      backgroundColor: CustomColor.screenBGColor,
      appBar: PrimaryAppBar(
        appbarSize: Dimensions.defaultAppBarHeight,
        toolbarHeight: Dimensions.defaultAppBarHeight,
        title: Text(
          Strings.createVoucher.tr,
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
        child: _bodyWidget(context, controller),
      ),
    );
  }

  // body widget contain all the widgets
  _bodyWidget(BuildContext context, CreateVoucherController controller) {
    return ListView(
      shrinkWrap: true,
      children: [
        _infoInputWidget(context, controller),
        SizedBox(
          height: Dimensions.heightSize * 2,
        ),
        _buttonWidget(context, controller),
        SizedBox(
          height: Dimensions.heightSize * 2,
        ),
      ],
    );
  }

  _infoInputWidget(BuildContext context, CreateVoucherController controller) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: CustomColor.secondaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Dimensions.radius * 2),
          bottomRight: Radius.circular(Dimensions.radius * 2),
        ),
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextLabelWidget(text: Strings.voucherCode.tr),
            SizedBox(
              height: Dimensions.heightSize,
            ),
            SecondaryTextInputWidget(
              controller: controller.voucherCodeController,
              hintText: Strings.redeemVoucherHint.tr,
              color: CustomColor.secondaryColor,
            ),
            SizedBox(
              height: Dimensions.heightSize,
            ),
            Text(
              '${Strings.charge.tr}: 2.00 USD + 1%',
              style: TextStyle(
                  fontSize: Dimensions.smallestTextSize * 0.8,
                  fontWeight: FontWeight.w200,
                  color: Colors.white.withOpacity(0.4)),
            )
          ],
        ),
      ),
    );
  }

  //  Button widget
  _buttonWidget(BuildContext context, CreateVoucherController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: PrimaryButton(
        title: Strings.redeemVoucher.tr,
        onPressed: () {
          controller.navigateToConfirmCreateVoucherCodeOutScreen();
        },
        borderColorName: CustomColor.primaryColor,
      ),
    );
  }
}
