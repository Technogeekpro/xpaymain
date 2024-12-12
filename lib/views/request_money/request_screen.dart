import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:xpay/utils/utils.dart';
import 'package:xpay/widgets/inputs/multiline_text_input_widget.dart';
import 'package:xpay/widgets/inputs/text_label_widget.dart';

import '../../controller/request_controller.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/inputs/amount_input_widget.dart';
import '../../widgets/inputs/dropdown_widget.dart';
import '../../widgets/inputs/secondary_text_input_widget.dart';
import '../../widgets/primary_appbar.dart';
import '../../widgets/request_money_wallet_info_widget.dart';
import '../auth/wallet_view_model.dart';

class RequestMoneyScreen extends StatefulWidget {
  RequestMoneyScreen({Key? key}) : super(key: key);

  @override
  State<RequestMoneyScreen> createState() => _RequestMoneyScreenState();
}

class _RequestMoneyScreenState extends State<RequestMoneyScreen> {
  final formKey = GlobalKey<FormState>();

  late final WalletViewModel? _walletViewModel;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RequestMoneyController());
    return Scaffold(
      backgroundColor: CustomColor.screenBGColor,
      appBar: PrimaryAppBar(
        appbarSize: Dimensions.defaultAppBarHeight,
        toolbarHeight: Dimensions.defaultAppBarHeight,
        title: Text(
          Strings.requestMoney.tr,
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
  _bodyWidget(BuildContext context, RequestMoneyController controller) {
    return ListView(
      shrinkWrap: true,
      children: [
        _infoInputWidget(context, controller),
        _noteWidget(context, controller),
        SizedBox(
          height: Dimensions.heightSize,
        ),
        _walletInfoWidget(context, controller),
        SizedBox(
          height: Dimensions.heightSize * 2,
        ),
        _buttonWidget(controller),
        SizedBox(
          height: Dimensions.heightSize * 2,
        ),
      ],
    );
  }

  _infoInputWidget(BuildContext context, RequestMoneyController controller) {
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
                  TextLabelWidget(text: Strings.requestTo.tr),
                  SizedBox(
                    height: Dimensions.heightSize,
                  ),
                  SecondaryTextInputWidget(
                    controller: controller.requestToController,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter an email address'),
                      EmailValidator(errorText: 'Enter a valid email address')
                    ]),
                    hintText: 'adsent@gmail.com',
                    color: CustomColor.secondaryColor,
                  ),
                  SizedBox(
                    height: Dimensions.heightSize * 0.3,
                  ),
                  Text(
                    Strings.validUserForTransaction.tr,
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
              TextLabelWidget(text: Strings.amountToRequest.tr),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              AmountInputWidget(
                hintText: '0.00',
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Please enter an amount'),
                  MinValueValidator(1, errorText: 'Minimum amount is 100')
                ]),
                controller: controller.amountController,
                color: CustomColor.secondaryColor,
                suffixIcon: _amountButton(context, controller),
              ),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              Text(
                '${Strings.limit}: 1.00 -  100,000.00 USD',
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

  _amountButton(BuildContext context, RequestMoneyController controller) {
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
  }

  //  Button widget
  _buttonWidget(RequestMoneyController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: PrimaryButton(
        title: Strings.requestNow.tr,
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            try {
              Utils.showLoadingDialog(context);
              await _walletViewModel!.requestMoney(
                  controller.requestToController.text.trim(),
                  double.parse(controller.amountController.text.trim()),
                  controller.walletName.value,
                  controller.optionalNoteController.text.trim().isEmpty
                      ? ''
                      : controller.optionalNoteController.text.trim());
              if (context.mounted) {
                Navigator.pop(context);
                Utils.showDialogMessage(
                    context, 'Success', 'Your request has been sent!');
                controller.requestToController.clear();
                controller.amountController.clear();
                controller.optionalNoteController.clear();
              }
            } catch (error) {
              if (context.mounted) {
                Navigator.pop(context);
                Utils.showDialogMessage(
                    context, 'Error', 'Error requesting money: $error');
              }
            }
          }
        },
        borderColorName: CustomColor.primaryColor,
      ),
    );
  }

  _walletInfoWidget(BuildContext context, RequestMoneyController controller) {
    return Obx(() {
      return Container(
        margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: RequestMoneyWalletInfoWidget(
          wallet: controller.walletName.value,
          merchant: controller.requestToController.text.isEmpty
              ? 'adsent@gmail.com'
              : controller.requestToController.text,
          transferAmount:
              '${controller.amountController.text.isNotEmpty ? controller.amountController.text : '100'} ${controller.walletName.value}',
          totalCharge:
              '${controller.calculateCharge(double.parse(controller.amountController.text.isNotEmpty ? controller.amountController.text : '100'))} ${controller.walletName.value}',
          youWillGet:
              '${double.parse(controller.amountController.text.isNotEmpty ? controller.amountController.text : '100') - controller.charge.value} ${controller.walletName.value}',
          note: controller.optionalNoteController.text.isEmpty
              ? Strings.addNoteHere.tr
              : controller.optionalNoteController.text,
        ),
      );
    });
  }

  _noteWidget(BuildContext context, RequestMoneyController controller) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      padding: const EdgeInsets.only(bottom: 20, top: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius * 2),
        color: const Color(0xff011526),
      ),
      child: Column(
        children: [
          TextLabelWidget(text: Strings.note.tr),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          MultiLineTextFieldInputWidget(
            controller: controller.optionalNoteController,
            hintText: Strings.optional.tr,
            color: CustomColor.secondaryColor,
            keyboardType: TextInputType.multiline,
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _walletViewModel = Provider.of<WalletViewModel>(context, listen: false);
  }
}
