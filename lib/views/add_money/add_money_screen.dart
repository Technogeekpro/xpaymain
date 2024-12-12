import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:xpay/controller/add_money_controller.dart';
import 'package:xpay/utils/utils.dart';
import 'package:xpay/views/auth/user_provider.dart';
import 'package:xpay/views/auth/wallet_view_model.dart';
import 'package:xpay/widgets/inputs/text_label_widget.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/add_money_wallet_info_widget.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/inputs/amount_input_widget.dart';
import '../../widgets/inputs/dropdown_widget.dart';
import '../../widgets/primary_appbar.dart';

class AddMoneyMoneyScreen extends StatefulWidget {
  AddMoneyMoneyScreen({Key? key}) : super(key: key);

  @override
  State<AddMoneyMoneyScreen> createState() => _AddMoneyMoneyScreenState();
}

class _AddMoneyMoneyScreenState extends State<AddMoneyMoneyScreen> {
  final formKey = GlobalKey<FormState>();

  final controller = Get.put(AddMoneyController());
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
          Strings.addMoney.tr,
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
  _bodyWidget(BuildContext context, AddMoneyController controller) {
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

  _infoInputWidget(BuildContext context, AddMoneyController controller) {
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
                  TextLabelWidget(text: Strings.gateway.tr),
                  SizedBox(
                    height: Dimensions.heightSize,
                  ),
                  DropDownInputWidget(
                    items: controller.gatewayList,
                    color: CustomColor.primaryColor.withOpacity(0.1),
                    hintText: Strings.selectTermHint.tr,
                    value: controller.gatewayName.value,
                    onChanged: (value) {
                      controller.gatewayName.value = value!;
                    },
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

  _amountButton(BuildContext context, AddMoneyController controller) {
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
  _buttonWidget(BuildContext context, AddMoneyController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: PrimaryButton(
        title: Strings.addMoney.tr,
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            _showCardDetailsDialog(context, _walletViewModel!);
          }
        },
        borderColorName: CustomColor.primaryColor,
      ),
    );
  }

  _walletInfoWidget(BuildContext context, AddMoneyController controller) {
    return Obx(() {
      return Container(
        margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: AddMoneyWalletInfoWidget(
          wallet: controller.walletName.value,
          gateWay: controller.gatewayName.value,
          addAmount:
              '${controller.amountController.text.isNotEmpty ? controller.amountController.text : '100'} ${controller.walletName.value}',
          totalCharge:
              '${controller.calculateCharge(double.parse(controller.amountController.text.isNotEmpty ? controller.amountController.text : '100'))} ${controller.walletName.value}',
          payableAmount:
              '${double.parse(controller.amountController.text.isNotEmpty ? controller.amountController.text : '100') + controller.charge.value} ${controller.walletName.value}',
        ),
      );
    });
  }

  void _showCardDetailsDialog(
      BuildContext context, WalletViewModel walletViewModel) {
    final formKey = GlobalKey<FormState>();
    final cardNumberController = TextEditingController();
    final expiryDateController = TextEditingController();
    final cvvController = TextEditingController();
    final cardHolderNameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Enter Card Details'),
          content: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: cardNumberController,
                    decoration: InputDecoration(labelText: 'Card Number'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter card number';
                      }
                      if (value.length < 16) {
                        return 'Card number must be 16 digits';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: expiryDateController,
                    decoration:
                        InputDecoration(labelText: 'Expiry Date (MM/YY)'),
                    keyboardType: TextInputType.datetime,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter expiry date';
                      }
                      if (!RegExp(r'(0[1-9]|1[0-2])\/?([0-9]{2})$')
                          .hasMatch(value)) {
                        return 'Please enter a valid expiry date';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: cvvController,
                    decoration: InputDecoration(labelText: 'CVV'),
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter CVV';
                      }
                      if (value.length < 3) {
                        return 'CVV must be 3 digits';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: cardHolderNameController,
                    decoration: InputDecoration(labelText: 'Cardholder Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter cardholder name';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  Navigator.pop(context); // Close the dialog
                  Utils.showLoadingDialog(context);
                  try {
                    await walletViewModel.addMoney(
                        double.parse(controller.amountController.text.trim()),
                        controller.walletName.value);
                    await _userProvider.fetchUserDetails();
                    if (context.mounted) {
                      Navigator.pop(context); // Close the loading dialog
                      Utils.showDialogMessage(
                        context,
                        'Success',
                        'Amount has been added to wallet!',
                      );
                      controller.amountController.clear();
                    }
                  } catch (error) {
                    Navigator.pop(context); // Close the loading dialog
                    Utils.showDialogMessage(
                      context,
                      'Error',
                      'Something went wrong: $error',
                    );
                  }
                }
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _walletViewModel = Provider.of<WalletViewModel>(context, listen: false);
    _userProvider = Provider.of<UserProvider>(context, listen: false);
  }
}
