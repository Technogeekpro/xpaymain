import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/request_to_me_controller.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/primary_appbar.dart';

class RequestToMeWalletInfoScreen extends StatelessWidget {
  RequestToMeWalletInfoScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RequestToMeController());
    return Scaffold(
      backgroundColor: CustomColor.screenBGColor,
      appBar: PrimaryAppBar(
        appbarSize: Dimensions.defaultAppBarHeight,
        toolbarHeight: Dimensions.defaultAppBarHeight,
        title: Text(
          Strings.requestToMe.tr,
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
  _bodyWidget(BuildContext context, RequestToMeController controller) {
    return ListView(
      shrinkWrap: true,
      children: [
        _requestItemDetailsWidget(context, controller),
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
  _buttonWidget(BuildContext context, RequestToMeController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          PrimaryButton(
            title: Strings.accept.tr,
            onPressed: () {
              controller.navigateToConfirmRequestToMeScreen();
            },
            borderColorName: CustomColor.primaryColor,
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          PrimaryButton(
            title: Strings.reject.tr,
            onPressed: () {
              controller.navigateToConfirmRequestToMeScreen();
            },
            borderColorName: const Color(0xffff3939),
            buttonColor: const Color(0xffff3939),
          ),
        ],
      ),
    );
  }

  _requestItemDetailsWidget(
      BuildContext context, RequestToMeController controller) {
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
                _requestItemDataWidget(
                  title: Strings.requestFrom.tr,
                  value: 'testuser@gmail.com',
                ),
                _requestItemDataWidget(
                  title: Strings.walletCurrency.tr,
                  value: 'USD',
                ),
                _requestItemDataWidget(
                  title: Strings.amount.tr,
                  value: '100.00 USD',
                ),
                _requestItemDataWidget(
                  title: Strings.senderNote.tr,
                  value: '11:28 AM - 3/1/2022',
                ),
                _requestItemDataWidget(
                  title: Strings.sentAt.tr,
                  value: '10.00 USD',
                ),
                _requestItemDataWidget(
                  title: Strings.status.tr,
                  value: '1.00 USD',
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

  _requestItemDataWidget({required String title, required String value}) {
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
