import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpay/controller/support_controller.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/inputs/text_field_input_widget.dart';
import '../../widgets/inputs/text_label_widget.dart';
import '../../widgets/primary_appbar.dart';

class CreateSupportTicketScreen extends StatelessWidget {
  CreateSupportTicketScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SupportController());
    return Scaffold(
      backgroundColor: CustomColor.screenBGColor,
      appBar: PrimaryAppBar(
        appbarSize: Dimensions.defaultAppBarHeight,
        toolbarHeight: Dimensions.defaultAppBarHeight,
        title: Text(
          Strings.createSupportTicket.tr,
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
  _bodyWidget(BuildContext context, SupportController controller) {
    return ListView(
      shrinkWrap: true,
      children: [
        _ticketInfoInputWidget(context, controller),
        _buttonWidget(context, controller),
        SizedBox(
          height: Dimensions.heightSize,
        ),
      ],
    );
  }

  _ticketInfoInputWidget(BuildContext context, SupportController controller) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: CustomColor.secondaryColor,
        borderRadius: BorderRadius.circular(Dimensions.radius * 2),
      ),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextLabelWidget(text: Strings.fullNameLabel.tr),
            TextFieldInputWidget(
              controller: controller.fullNameController,
              hintText: Strings.enterFullNameHint.tr,
              borderColor: CustomColor.primaryColor,
              color: CustomColor.secondaryColor,
            ),
            SizedBox(
              height: Dimensions.heightSize,
            ),
            TextLabelWidget(text: Strings.email.tr),
            TextFieldInputWidget(
              controller: controller.emailController,
              hintText: Strings.enterEmailHint.tr,
              borderColor: CustomColor.primaryColor,
              color: CustomColor.secondaryColor,
            ),
            SizedBox(
              height: Dimensions.heightSize,
            ),
            TextLabelWidget(text: Strings.subject.tr),
            TextFieldInputWidget(
              controller: controller.subjectController,
              hintText: Strings.subject.tr,
              borderColor: CustomColor.primaryColor,
              color: CustomColor.secondaryColor,
            ),
            SizedBox(
              height: Dimensions.heightSize,
            ),
            TextLabelWidget(text: Strings.message.tr),
            TextFieldInputWidget(
              controller: controller.messageController,
              hintText: Strings.messageHint.tr,
              borderColor: CustomColor.primaryColor,
              color: CustomColor.secondaryColor,
            ),
            _attachWidget(context, controller),
          ],
        ),
      ),
    );
  }

  //  Button widget
  _buttonWidget(BuildContext context, SupportController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: PrimaryButton(
        title: Strings.submit.tr,
        onPressed: () {
          // controller.navigateToTransferMoneyScanQrCodeScreen();
        },
        borderColorName: CustomColor.primaryColor,
      ),
    );
  }

  _attachWidget(BuildContext context, SupportController controller) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius * 2),
            border: Border.all(color: CustomColor.primaryColor, width: 1.5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.attach_file,
              color: CustomColor.primaryColor.withOpacity(0.4),
            ),
            Text(
              Strings.attachments.tr,
              style: TextStyle(color: Colors.white.withOpacity(0.4)),
            )
          ],
        ),
      ),
    );
  }
}
