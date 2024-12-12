import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpay/controller/withdraw_controller.dart';
import 'package:xpay/widgets/inputs/text_label_widget.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/inputs/dropdown_widget.dart';
import '../../widgets/inputs/secondary_text_input_widget.dart';
import '../../widgets/primary_appbar.dart';

class AddWithdrawMethodScreen extends StatelessWidget {
  AddWithdrawMethodScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WithdrawController());
    return Scaffold(
      backgroundColor: CustomColor.screenBGColor,
      appBar: PrimaryAppBar(
        appbarSize: Dimensions.defaultAppBarHeight,
        toolbarHeight: Dimensions.defaultAppBarHeight,
        title: Text(
          Strings.addWithdrawMethod.tr,
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
  _bodyWidget(BuildContext context, WithdrawController controller) {
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

  _infoInputWidget(BuildContext context, WithdrawController controller) {
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
              TextLabelWidget(text: Strings.selectMethod.tr),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              DropDownInputWidget(
                items: controller.methodList,
                color: CustomColor.primaryColor.withOpacity(0.1),
                hintText: Strings.selectMethod.tr,
                value: controller.methodName.value,
                onChanged: (value) {
                  controller.methodName.value = value!;
                },
              ),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              TextLabelWidget(text: Strings.selectCurrency.tr),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              DropDownInputWidget(
                items: controller.currencyList,
                color: CustomColor.primaryColor.withOpacity(0.1),
                hintText: Strings.selectCurrency.tr,
                value: controller.currencyName.value,
                onChanged: (value) {
                  controller.currencyName.value = value!;
                },
              ),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextLabelWidget(text: Strings.provideANickName.tr),
                  SizedBox(
                    height: Dimensions.heightSize,
                  ),
                  SecondaryTextInputWidget(
                    controller: controller.provideANickNameHint,
                    hintText: Strings.provideANickNameHint.tr,
                    color: CustomColor.secondaryColor,
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
  _buttonWidget(BuildContext context, WithdrawController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: PrimaryButton(
        title: Strings.addMethod.tr,
        onPressed: () {},
        borderColorName: CustomColor.primaryColor,
      ),
    );
  }
}
