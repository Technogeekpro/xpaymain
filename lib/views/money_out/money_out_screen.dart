import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:xpay/utils/utils.dart';
import 'package:xpay/views/auth/user_provider.dart';
import 'package:xpay/views/auth/wallet_view_model.dart';
import 'package:xpay/widgets/inputs/text_label_widget.dart';

import '../../controller/money_out_controller.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/inputs/amount_input_widget.dart';
import '../../widgets/inputs/dropdown_widget.dart';
import '../../widgets/inputs/secondary_text_input_widget.dart';
import '../../widgets/money_out_wallet_info_widget.dart';
import '../../widgets/primary_appbar.dart';

class MoneyOutScreen extends StatefulWidget {
  MoneyOutScreen({Key? key}) : super(key: key);

  @override
  State<MoneyOutScreen> createState() => _MoneyOutScreenState();
}

class _MoneyOutScreenState extends State<MoneyOutScreen> {
  final formKey = GlobalKey<FormState>();

  final controller = Get.put(MoneyOutController());
  late final WalletViewModel? _walletViewModel;
  late final UserProvider _userProvider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.screenBGColor,
      appBar: PrimaryAppBar(
        appbarSize: Dimensions.defaultAppBarHeight,
        toolbarHeight: Dimensions.defaultAppBarHeight,
        title: Text(
          Strings.moneyOut.tr,
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
  _bodyWidget(BuildContext context, MoneyOutController controller) {
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

  _infoInputWidget(BuildContext context, MoneyOutController controller) {
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
                  TextLabelWidget(text: Strings.agentUsernameOrEmail.tr),
                  SizedBox(
                    height: Dimensions.heightSize,
                  ),
                  SecondaryTextInputWidget(
                    controller: controller.agentUsernameOrEmailController,
                    hintText: Strings.agentUsernameOrEmail.tr,
                    validator: MultiValidator([
                      RequiredValidator(
                          errorText: 'Please enter an email address'),
                      EmailValidator(
                          errorText: 'Please enter a valid email address')
                    ]),
                    color: CustomColor.secondaryColor,
                    keyboardType: TextInputType.emailAddress,
                    suffixIcon: Icons.photo_camera,
                    onTap: () {
                      controller.navigateToMoneyOutScanQrCodeScreen();
                    },
                  ),
                  SizedBox(
                    height: Dimensions.heightSize * 0.3,
                  ),
                  Text(
                    Strings.validUserForMoneyOut.tr,
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
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Please enter an amount'),
                  MinValueValidator(1, errorText: 'Minimum amount is 1')
                ]),
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

  _amountButton(BuildContext context, MoneyOutController controller) {
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
  _buttonWidget(BuildContext context, MoneyOutController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: PrimaryButton(
        title: Strings.moneyOut.tr,
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            Utils.showLoadingDialog(context);
            try {
              await _walletViewModel!.sendMoneyToUser(
                  controller.agentUsernameOrEmailController.text.trim(),
                  double.parse(controller.amountController.text.trim()),
                  controller.walletName.value);
              await _userProvider.fetchUserDetails();
              if (context.mounted) {
                Navigator.pop(context);
                Utils.showDialogMessage(
                    context, 'Success', 'Money has been sent successfully!');
                controller.amountController.clear();
                controller.agentUsernameOrEmailController.clear();
              }
            } catch (e) {
              Navigator.pop(context); // Dismiss loading dialog on error
              Utils.showDialogMessage(context, 'Error', '$e');
            }
          }
        },
        borderColorName: CustomColor.primaryColor,
      ),
    );
  }

  _walletInfoWidget(BuildContext context, MoneyOutController controller) {
    return Obx(() {
      return Container(
        margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: MoneyOutWalletInfoWidget(
          wallet: controller.walletName.value,
          agent: controller.agentUsernameOrEmailController.text.isEmpty
              ? 'adsent@gmail.com'
              : controller.agentUsernameOrEmailController.text,
          transferAmount:
              '${controller.amountController.text.isNotEmpty ? controller.amountController.text : '100'} ${controller.walletName.value}',
          totalCharge:
              '${controller.calculateCharge(double.parse(controller.amountController.text.isNotEmpty ? controller.amountController.text : '100'))} ${controller.walletName.value}',
          payableAmount:
              '${double.parse(controller.amountController.text.isNotEmpty ? controller.amountController.text : '100') + controller.charge.value} ${controller.walletName.value}',
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _walletViewModel = Provider.of<WalletViewModel>(context, listen: false);
    _userProvider = Provider.of<UserProvider>(context, listen: false);
  }
}
