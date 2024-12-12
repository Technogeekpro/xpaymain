import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/invoice_controller.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/my_support_item_widget.dart';
import '../../widgets/primary_appbar.dart';

class MySupportTickets extends StatelessWidget {
  MySupportTickets({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(InvoiceController());
    return Scaffold(
      backgroundColor: CustomColor.screenBGColor,
      appBar: PrimaryAppBar(
        appbarSize: Dimensions.defaultAppBarHeight,
        toolbarHeight: Dimensions.defaultAppBarHeight,
        title: Text(
          Strings.mySupportTickets.tr,
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
  _bodyWidget(BuildContext context, InvoiceController controller) {
    return ListView(
      shrinkWrap: true,
      children: [
        _transactionsSection(context, controller),
      ],
    );
  }

  _transactionsSection(BuildContext context, InvoiceController controller) {
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
    List<MySupportTicketsItemWidget> voucherList = [
      const MySupportTicketsItemWidget(
        imagePath: Strings.payBillImagePath,
        title: 'Here is Headline',
        dateAndTime: '11:28 AM - 3/1/2022',
        subTitle: 'Here is details of ticket.....',
        isSolved: false,
        isRejected: true,
        transactionNumber: 'TN- 12345678',
      ),
      const MySupportTicketsItemWidget(
        imagePath: Strings.payBillImagePath,
        title: 'Here is Headline',
        dateAndTime: '11:28 AM - 3/1/2022',
        subTitle: 'Here is details of ticket.....',
        isSolved: true,
        isRejected: false,
        transactionNumber: 'TN- 12345678',
      ),
      const MySupportTicketsItemWidget(
        imagePath: Strings.payBillImagePath,
        title: 'Here is Headline',
        dateAndTime: '11:28 AM - 3/1/2022',
        subTitle: 'Here is details of ticket.....',
        isSolved: false,
        isRejected: false,
        transactionNumber: 'TN- 12345678',
      ),
      const MySupportTicketsItemWidget(
        imagePath: Strings.payBillImagePath,
        title: 'Here is Headline',
        dateAndTime: '11:28 AM - 3/1/2022',
        subTitle: 'Here is details of ticket.....',
        isSolved: true,
        isRejected: false,
        transactionNumber: 'TN- 12345678',
      ),
      const MySupportTicketsItemWidget(
        imagePath: Strings.payBillImagePath,
        title: 'Here is Headline',
        dateAndTime: '11:28 AM - 3/1/2022',
        subTitle: 'Here is details of ticket.....',
        isSolved: false,
        isRejected: false,
        transactionNumber: 'TN- 12345678',
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
