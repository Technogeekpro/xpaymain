import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpay/controller/create_voucher_controller.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/primary_appbar.dart';
import '../../widgets/voucher_item_widget.dart';

class VoucherScreen extends StatelessWidget {
  VoucherScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateVoucherController());
    return Scaffold(
      backgroundColor: CustomColor.screenBGColor,
      appBar: PrimaryAppBar(
        appbarSize: Dimensions.defaultAppBarHeight,
        toolbarHeight: Dimensions.defaultAppBarHeight,
        title: Text(
          Strings.voucher.tr,
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
                controller.navigateToCreateVoucherScreen();
              },
              icon: Icon(
                Icons.add_circle,
                color: Colors.white.withOpacity(0.5),
              ))
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
  _bodyWidget(BuildContext context, CreateVoucherController controller) {
    return ListView(
      shrinkWrap: true,
      children: [
        _transactionsSection(context, controller),
      ],
    );
  }

  _transactionsSection(
      BuildContext context, CreateVoucherController controller) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        SizedBox(
          child: _transactionsBodyWidget(context),
        ),
      ],
    );
  }

  // transaction tab section
  _transactionsBodyWidget(BuildContext context) {
    List<VoucherItemWidget> voucherList = [
      const VoucherItemWidget(
        imagePath: Strings.payBillImagePath,
        title: '5872-3096-5737-9477',
        dateAndTime: '11:28 AM - 3/1/2022',
        subTitle: '1400.00 USD',
        isUsed: false,
      ),
      const VoucherItemWidget(
        imagePath: Strings.payBillImagePath,
        title: '5872-3096-5737-9477',
        dateAndTime: '11:28 AM - 3/1/2022',
        subTitle: '1400.00 USD',
        isUsed: true,
      ),
      const VoucherItemWidget(
        imagePath: Strings.payBillImagePath,
        title: '5872-3096-5737-9477',
        dateAndTime: '11:28 AM - 3/1/2022',
        subTitle: '1400.00 USD',
        isUsed: false,
      ),
      const VoucherItemWidget(
        imagePath: Strings.payBillImagePath,
        title: '5872-3096-5737-9477',
        dateAndTime: '11:28 AM - 3/1/2022',
        subTitle: '1400.00 USD',
        isUsed: true,
      ),
      const VoucherItemWidget(
        imagePath: Strings.payBillImagePath,
        title: '5872-3096-5737-9477',
        dateAndTime: '11:28 AM - 3/1/2022',
        subTitle: '1400.00 USD',
        isUsed: false,
      ),
    ];

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: voucherList.length,
        itemBuilder: (context, index) => voucherList[index],
      ),
    );
  }
}
