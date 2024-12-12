import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/add_money_history_widget.dart';
import '../../widgets/primary_appbar.dart';

class AddMoneyHistoryScreen extends StatelessWidget {
  AddMoneyHistoryScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.screenBGColor,
      appBar: PrimaryAppBar(
        appbarSize: Dimensions.defaultAppBarHeight,
        toolbarHeight: Dimensions.defaultAppBarHeight,
        title: Text(
          Strings.addMoneyHistory.tr,
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
        child: _bodyWidget(context),
      ),
    );
  }

  // body widget contain all the widgets
  _bodyWidget(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        _transactionsSection(context),
      ],
    );
  }

  _transactionsSection(BuildContext context) {
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
    List<AddMoneyHistoryItemWidget> addMoneyHistoryList = [
      const AddMoneyHistoryItemWidget(
        imagePath: Strings.payBillImagePath,
        title: 'Money In',
        dateAndTime: '11:28 AM - 3/1/2022',
        subTitle: 'Money In from adsent',
        amount: '100.00 USD',
      ),
      const AddMoneyHistoryItemWidget(
        imagePath: Strings.payBillImagePath,
        title: 'Money In',
        dateAndTime: '11:28 AM - 3/1/2022',
        subTitle: 'Money In from adsent',
        amount: '100.00 USD',
      ),
      const AddMoneyHistoryItemWidget(
        imagePath: Strings.payBillImagePath,
        title: 'Money In',
        dateAndTime: '11:28 AM - 3/1/2022',
        subTitle: 'Money In from adsent',
        amount: '100.00 USD',
      ),
    ];

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: addMoneyHistoryList.length,
        itemBuilder: (context, index) => addMoneyHistoryList[index],
      ),
    );
  }
}
