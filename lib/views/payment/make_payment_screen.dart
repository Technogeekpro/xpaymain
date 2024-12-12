import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpay/widgets/inputs/text_label_widget.dart';

import '../../controller/payment_controller.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/inputs/amount_input_widget.dart';
import '../../widgets/inputs/dropdown_widget.dart';
import '../../widgets/inputs/secondary_text_input_widget.dart';
import '../../widgets/make_payment_wallet_info_widget.dart';
import '../../widgets/primary_appbar.dart';

class MakePaymentScreen extends StatelessWidget {
  MakePaymentScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.screenBGColor,
      appBar: PrimaryAppBar(
        appbarSize: Dimensions.defaultAppBarHeight,
        toolbarHeight: Dimensions.defaultAppBarHeight,
        title: Text(
          Strings.makePayment.tr,
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
  _bodyWidget(BuildContext context, PaymentController controller) {
    return ListView(
      shrinkWrap: true,
      children: [
        _infoInputWidget(context, controller),
        _walletInfoWidget(context, controller),
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

  _infoInputWidget(BuildContext context, PaymentController controller) {
    return Obx(() {
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
              SizedBox(
                height: Dimensions.heightSize,
              ),
              TextLabelWidget(text: Strings.yourWallet.tr),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              DropDownInputWidget(
                items: controller.walletList,
                color: CustomColor.primaryColor.withOpacity(0.1),
                hintText: Strings.selectTermHint.tr,
                value: controller.walletName.value,
                onChanged: (value) {
                  controller.walletName.value = value!;
                },
              ),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextLabelWidget(text: Strings.merchantUsernameOrEmail.tr),
                  SizedBox(
                    height: Dimensions.heightSize,
                  ),
                  SecondaryTextInputWidget(
                    controller: controller.merchantUsernameOrEmailController,
                    hintText: Strings.merchantUsernameOrEmailHint.tr,
                    color: CustomColor.secondaryColor,
                    suffixIcon: Icons.photo_camera,
                    onTap: () {
                      controller.navigateToMakePaymentScanQrCodeScreen();
                    },
                  ),
                  SizedBox(
                    height: Dimensions.heightSize * 0.3,
                  ),
                  Text(
                    Strings.validMerchantForMoneyOut.tr,
                    style: TextStyle(
                      fontSize: Dimensions.smallestTextSize * 0.8,
                      fontWeight: FontWeight.w200,
                      color: const Color(0xff00bb38).withOpacity(0.8),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              TextLabelWidget(text: Strings.amount.tr),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              AmountInputWidget(
                hintText: '0.00',
                controller: controller.amountController,
                color: CustomColor.secondaryColor,
                suffixIcon: _amountButton(context, controller),
              ),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              Text(
                '${Strings.limit.tr}: 1.00 -  100,000.00 USD',
                style: TextStyle(
                    fontSize: Dimensions.smallestTextSize * 0.8,
                    fontWeight: FontWeight.w200,
                    color: Colors.white.withOpacity(0.4)),
              ),
              SizedBox(
                height: Dimensions.heightSize * 0.5,
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
    });
  }

  _amountButton(BuildContext context, PaymentController controller) {
    return Obx(() {
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
          children: [
            Text(
              controller.walletName.value,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: Dimensions.mediumTextSize,
              ),
            )
          ],
        ),
      );
    });
  }

  //  Button widget
  _buttonWidget(BuildContext context, PaymentController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: PrimaryButton(
        title: Strings.makePayment.tr,
        onPressed: () {
          controller.navigateToConfirmMakePaymentOutScreen();
        },
        borderColorName: CustomColor.primaryColor,
      ),
    );
  }

  _walletInfoWidget(BuildContext context, PaymentController controller) {
    return Obx(() {
      return Container(
        margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: MakePaymentWalletInfoWidget(
          wallet: controller.walletName.value,
          merchant: controller.merchantUsernameOrEmailController.text.isEmpty
              ? 'adsent@gmail.com'
              : controller.merchantUsernameOrEmailController.text,
          transferAmount:
              '${controller.amountController.text} ${controller.walletName.value}',
          totalCharge:
              '${controller.calculateCharge(double.parse(controller.amountController.text))} ${controller.walletName.value}',
          payableAmount:
              '${double.parse(controller.amountController.text) + controller.charge.value} ${controller.walletName.value}',
        ),
      );
    });
  }
}
