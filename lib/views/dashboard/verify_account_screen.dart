import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpay/widgets/primary_appbar.dart';

import '../../controller/dashboard_controller.dart';
import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/inputs/text_field_input_widget.dart';
import '../../widgets/inputs/text_label_widget.dart';

class VerifyAccountScreen extends StatelessWidget {
  VerifyAccountScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    return Scaffold(
      appBar: PrimaryAppBar(
        appbarColor: CustomColor.primaryColor,
        backgroundColor: CustomColor.primaryColor,
        autoLeading: false,
        elevation: 1,
        appBar: AppBar(),
        title: Text(Strings.verifyAccount.tr),
        appbarSize: Dimensions.defaultAppBarHeight,
        toolbarHeight: Dimensions.defaultAppBarHeight,
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
      backgroundColor: CustomColor.screenBGColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.only(
            top: Dimensions.defaultPaddingSize * 0.5,
            left: Dimensions.defaultPaddingSize * 0.5,
            right: Dimensions.defaultPaddingSize * 0.5,
          ),
          child: _bodyWidget(context, controller),
        ),
      ),
    );
  }

  // body widget containing all widget elements
  _bodyWidget(BuildContext context, DashboardController controller) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.fillTheInfo.tr,
              style: TextStyle(
                color: CustomColor.primaryTextColor.withOpacity(0.5),
                fontSize: Dimensions.smallestTextSize,
                fontWeight: FontWeight.w200,
              ),
            ),
            SizedBox(
              height: Dimensions.heightSize,
            ),
            _verifyInfoInputWidget(context, controller),
            SizedBox(
              height: Dimensions.heightSize,
            ),
            _buttonWidget(context, controller),
          ],
        ),
      ],
    );
  }

  _verifyInfoInputWidget(BuildContext context, DashboardController controller) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: CustomColor.secondaryColor,
          borderRadius: BorderRadius.circular(Dimensions.radius)),
      child: Column(
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                TextLabelWidget(text: Strings.nidName.tr),
                TextFieldInputWidget(
                  controller: controller.nidNameController,
                  hintText: Strings.nidNameHint.tr,
                  borderColor: CustomColor.primaryColor,
                  color: CustomColor.secondaryColor,
                ),
                SizedBox(
                  height: Dimensions.heightSize,
                ),
                TextLabelWidget(text: Strings.nidNumber.tr),
                TextFieldInputWidget(
                  controller: controller.nidNumberController,
                  hintText: Strings.nidNumberHint.tr,
                  borderColor: CustomColor.primaryColor,
                  color: CustomColor.secondaryColor,
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius * 2),
              border: Border.all(
                width: 1,
                color: CustomColor.primaryColor,
              ),
            ),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.arrow_upward,
                    color: CustomColor.primaryColor,
                  ),
                  SizedBox(
                    width: Dimensions.widthSize * 0.5,
                  ),
                  Text(
                    Strings.uploadFile.tr,
                    style: TextStyle(
                      color: CustomColor.primaryTextColor.withOpacity(0.5),
                      fontSize: Dimensions.smallestTextSize,
                      fontWeight: FontWeight.w200,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _buttonWidget(BuildContext context, DashboardController controller) {
    return PrimaryButton(
      title: Strings.submit.tr,
      onPressed: () {},
      borderColorName: CustomColor.primaryColor,
    );
  }
}
