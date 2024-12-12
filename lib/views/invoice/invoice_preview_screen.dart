import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpay/controller/invoice_controller.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/inputs/text_label_widget.dart';
import '../../widgets/primary_appbar.dart';

class InvoicePreviewScreen extends StatelessWidget {
  InvoicePreviewScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(InvoiceController());
    return Scaffold(
      backgroundColor: CustomColor.screenBGColor,
      appBar: PrimaryAppBar(
        appbarSize: Dimensions.defaultAppBarHeight,
        toolbarHeight: Dimensions.defaultAppBarHeight,
        title: Text(
          Strings.invoicePreview.tr,
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
  _bodyWidget(BuildContext context, InvoiceController controller) {
    return ListView(
      shrinkWrap: true,
      children: [
        _invoiceItemWidget(context, controller),
        _invoiceItemDetailsWidget(context, controller),
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

  //  Button widget
  _buttonWidget(BuildContext context, InvoiceController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: PrimaryButton(
        title: Strings.confirm.tr,
        onPressed: () {
          controller.navigateToConfirmInvoiceScreen();
        },
        borderColorName: CustomColor.primaryColor,
      ),
    );
  }

  _invoiceItemDetailsWidget(
      BuildContext context, InvoiceController controller) {
    return Container(
      margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius * 2),
          color: const Color(0xff011526)),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
            child: Column(
              children: [
                TextLabelWidget(text: Strings.invoiceDetails.tr),
                const Divider(
                  thickness: 1.5,
                  color: CustomColor.secondaryColor,
                ),
                _invoiceItemDataWidget(
                  title: Strings.invoiceTo.tr,
                  value: controller.invoiceToController.text,
                ),
                _invoiceItemDataWidget(
                  title: Strings.email.tr,
                  value: controller.emailController.text,
                ),
                _invoiceItemDataWidget(
                  title: Strings.address.tr,
                  value: controller.addressController.text,
                ),
                _invoiceItemDataWidget(
                  title: Strings.walletCurrency.tr,
                  value: controller.walletName.value,
                ),
                _invoiceItemDataWidget(
                  title: Strings.amount.tr,
                  value:
                      '${controller.amountController.text} ${controller.walletName.value}',
                ),
                _invoiceItemDataWidget(
                  title: Strings.totalCharge.tr,
                  value:
                      '${controller.calculateCharge(double.parse(controller.amountController.text))} ${controller.walletName.value}',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.payableAmount.tr,
                      style: TextStyle(
                        color: CustomColor.primaryTextColor.withOpacity(0.5),
                        fontSize: Dimensions.smallestTextSize,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    Text(
                      '11.00 USD',
                      style: TextStyle(
                        color: CustomColor.primaryTextColor.withOpacity(0.5),
                        fontSize: Dimensions.smallestTextSize,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _invoiceItemWidget(BuildContext context, InvoiceController controller) {
    return Container(
      margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius * 2),
          color: const Color(0xff011526)),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
            child: Column(
              children: [
                TextLabelWidget(text: Strings.invoiceItem.tr),
                const Divider(
                  thickness: 1.5,
                  color: CustomColor.secondaryColor,
                ),
                _invoiceItemDataWidget(
                  title: 'Product Name 1',
                  value: '5.00 USD',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Name 2',
                      style: TextStyle(
                        color: CustomColor.primaryTextColor.withOpacity(0.5),
                        fontSize: Dimensions.smallestTextSize,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    Text(
                      '5.00 USD',
                      style: TextStyle(
                        color: CustomColor.primaryTextColor.withOpacity(0.5),
                        fontSize: Dimensions.smallestTextSize,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _invoiceItemDataWidget({required String title, required String value}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: CustomColor.primaryTextColor.withOpacity(0.5),
                fontSize: Dimensions.smallestTextSize,
                fontWeight: FontWeight.w200,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                color: CustomColor.primaryTextColor.withOpacity(0.5),
                fontSize: Dimensions.smallestTextSize,
                fontWeight: FontWeight.w200,
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 1.5,
          color: CustomColor.secondaryColor,
        )
      ],
    );
  }
}
