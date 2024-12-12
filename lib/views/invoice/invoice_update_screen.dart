import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpay/widgets/inputs/text_label_widget.dart';

import '../../controller/invoice_controller.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/inputs/amount_input_widget.dart';
import '../../widgets/inputs/dropdown_widget.dart';
import '../../widgets/inputs/secondary_text_input_widget.dart';
import '../../widgets/primary_appbar.dart';

class InvoiceUpdateScreen extends StatelessWidget {
  InvoiceUpdateScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final invoiceFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(InvoiceController());
    return Scaffold(
      backgroundColor: CustomColor.screenBGColor,
      appBar: PrimaryAppBar(
        appbarSize: Dimensions.defaultAppBarHeight,
        toolbarHeight: Dimensions.defaultAppBarHeight,
        title: Text(
          Strings.invoiceUpdate.tr,
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
        action: [
          IconButton(
            onPressed: () {
              _invoiceUpdateOption(context, controller);
            },
            icon: Icon(
              Icons.settings,
              color: Colors.white,
              size: Dimensions.iconSizeDefault * 1.4,
            ),
          ),
        ],
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
        _infoInputWidget(context, controller),
        _invoiceInfoInputWidget(context, controller),
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

  _infoInputWidget(BuildContext context, InvoiceController controller) {
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
              TextLabelWidget(text: Strings.invoiceTo.tr),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              SecondaryTextInputWidget(
                controller: controller.invoiceToController,
                hintText: Strings.invoiceTo.tr,
                color: CustomColor.secondaryColor,
              ),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              TextLabelWidget(text: Strings.email.tr),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              SecondaryTextInputWidget(
                controller: controller.emailController,
                hintText: Strings.emailInvoice.tr,
                color: CustomColor.secondaryColor,
              ),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              TextLabelWidget(text: Strings.address.tr),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              SecondaryTextInputWidget(
                controller: controller.addressController,
                hintText: Strings.addressHint.tr,
                color: CustomColor.secondaryColor,
              ),
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
            ],
          ),
        ),
      );
    });
  }

  _invoiceInfoInputWidget(BuildContext context, InvoiceController controller) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: CustomColor.secondaryColor,
          borderRadius: BorderRadius.circular(Dimensions.radius * 2)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.invoiceItem.tr,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Dimensions.mediumTextSize,
                ),
              ),
              IconButton(
                onPressed: () {
                  // controller.navigateToCreateInvoiceScreen();
                },
                icon: Icon(
                  Icons.add_circle,
                  color: Colors.white.withOpacity(0.3),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          Form(
            key: invoiceFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextLabelWidget(text: Strings.itemName.tr),
                SizedBox(
                  height: Dimensions.heightSize,
                ),
                SecondaryTextInputWidget(
                  controller: controller.itemNameController,
                  hintText: Strings.itemNameHint.tr,
                  color: CustomColor.secondaryColor,
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  _amountButton(BuildContext context, InvoiceController controller) {
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
  _buttonWidget(BuildContext context, InvoiceController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: PrimaryButton(
        title: Strings.updateInvoice.tr,
        onPressed: () {
          controller.navigateToDashboardScreen();
          Get.delete<InvoiceController>();
        },
        borderColorName: CustomColor.primaryColor,
      ),
    );
  }

  // invoice update widget
  _invoiceUpdateOption(BuildContext context, InvoiceController controller) {
    return showDialog(
      context: context,
      builder: (context) {
        return Align(
          alignment: Alignment.topRight,
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                color: CustomColor.secondaryColor,
                borderRadius: BorderRadius.circular(
                  Dimensions.radius * 2,
                ),
              ),
              margin: const EdgeInsets.only(top: 85, right: 20),
              padding: const EdgeInsets.only(top: 25),
              width: MediaQuery.of(context).size.width * 0.65,
              height: MediaQuery.of(context).size.height * 0.45,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _optionItemWidget(
                    title: Strings.sendToEmail.tr,
                    onTap: () {},
                  ),
                  _optionItemWidget(
                    title: Strings.copyInvoiceUrl.tr,
                    onTap: () {},
                  ),
                  _optionItemWidget(
                    title: Strings.publishInvoice.tr,
                    onTap: () {},
                  ),
                  _optionItemWidget(
                    title: Strings.downloadInvoice.tr,
                    onTap: () {},
                  ),
                  SizedBox(
                    height: Dimensions.heightSize,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: Text(
                        Strings.discardInvoice.tr,
                        style: TextStyle(
                          color: CustomColor.primaryTextColor,
                          fontSize: Dimensions.smallestTextSize,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _optionItemWidget({
    required String title,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Dimensions.heightSize,
        ),
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Text(
              title,
              style: TextStyle(
                color: CustomColor.primaryTextColor,
                fontSize: Dimensions.smallestTextSize,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
        ),
        SizedBox(
          height: Dimensions.heightSize,
        ),
        Divider(
          thickness: 1.5,
          color: CustomColor.screenBGColor.withOpacity(0.8),
        ),
      ],
    );
  }
}
