import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpay/controller/currency_exchange_controller.dart';
import 'package:xpay/widgets/inputs/text_label_widget.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/currency_exchange_wallte_info_widget.dart';
import '../../widgets/inputs/dropdown_widget.dart';
import '../../widgets/inputs/secondary_text_input_widget.dart';
import '../../widgets/primary_appbar.dart';

class CurrencyExchangeScreen extends StatelessWidget {
  CurrencyExchangeScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CurrencyExchangeController());
    return Scaffold(
      backgroundColor: CustomColor.screenBGColor,
      appBar: PrimaryAppBar(
        appbarSize: Dimensions.defaultAppBarHeight,
        toolbarHeight: Dimensions.defaultAppBarHeight,
        title: Text(
          Strings.currencyExchange.tr,
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
  _bodyWidget(BuildContext context, CurrencyExchangeController controller) {
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

  _infoInputWidget(
      BuildContext context, CurrencyExchangeController controller) {
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
              TextLabelWidget(text: Strings.amount.tr),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              SecondaryTextInputWidget(
                controller: controller.amountController,
                hintText: '0.00',
                color: CustomColor.secondaryColor,
              ),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              TextLabelWidget(text: Strings.fromCurrency.tr),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              DropDownInputWidget(
                items: controller.formCurrencyList,
                color: CustomColor.primaryColor.withOpacity(0.1),
                hintText: Strings.selectTermHint.tr,
                value: controller.formCurrencyName.value,
                onChanged: (value) {
                  controller.formCurrencyName.value = value!;
                },
              ),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextLabelWidget(text: Strings.toCurrency.tr),
                  SizedBox(
                    height: Dimensions.heightSize,
                  ),
                  DropDownInputWidget(
                    items: controller.toCurrencyList,
                    color: CustomColor.primaryColor.withOpacity(0.1),
                    hintText: Strings.selectTermHint.tr,
                    value: controller.toCurrencyName.value,
                    onChanged: (value) {
                      controller.toCurrencyName.value = value!;
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  //  Button widget
  _buttonWidget(BuildContext context, CurrencyExchangeController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: PrimaryButton(
        title: Strings.exchangeNow.tr,
        onPressed: () {
          controller.navigateToConfirmCurrencyExchangeScreen();
        },
        borderColorName: CustomColor.primaryColor,
      ),
    );
  }

  _walletInfoWidget(
      BuildContext context, CurrencyExchangeController controller) {
    return Obx(() {
      return Container(
        margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: CurrencyExchangeInfoWidget(
          fromCurrencyAmount:
              '${controller.amountController.text} ${controller.formCurrencyName.value}',
          toCurrencyAmount:
              '${controller.amountController.text} ${controller.toCurrencyName.value}',
          fromCurrency: controller.formCurrencyName.value,
          toCurrency: controller.toCurrencyName.value,
        ),
      );
    });
  }
}
