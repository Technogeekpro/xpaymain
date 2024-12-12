import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/withdraw_controller.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/primary_appbar.dart';
import '../../widgets/withdraw_method_widget.dart';

class WithdrawScreen extends StatelessWidget {
  WithdrawScreen({Key? key}) : super(key: key);

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
          Strings.withdrawMethod.tr,
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
              controller.navigateAddWithdrawMethodScreen();
            },
            icon: Icon(
              Icons.add_circle,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
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
  _bodyWidget(BuildContext context, WithdrawController controller) {
    return ListView(
      shrinkWrap: true,
      children: [
        _transactionsSection(context, controller),
      ],
    );
  }

  _transactionsSection(BuildContext context, WithdrawController controller) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        SizedBox(
          child: _transactionsBodyWidget(context, controller),
        ),
      ],
    );
  }

  // transaction tab section
  _transactionsBodyWidget(BuildContext context, WithdrawController controller) {
    List<WithdrawMethodItemWidget> voucherList = [
      WithdrawMethodItemWidget(
        imagePath: Strings.payBillImagePath,
        title: 'Paypal USD',
        limit: 'Limit: 1.00 -  100,000.00 USD',
        charge: 'Charge: 2.00 USD + 1%',
        onTap: () {
          controller.navigateWithdrawMoneyScreen();
        },
      ),
      WithdrawMethodItemWidget(
        imagePath: Strings.payBillImagePath,
        title: 'Stripe USD',
        limit: '${Strings.limit.tr}: 1.00 -  100,000.00 USD',
        charge: '${Strings.charge.tr}: 2.00 USD + 1%',
        onTap: () {
          controller.navigateWithdrawMoneyScreen();
        },
      ),
      WithdrawMethodItemWidget(
        imagePath: Strings.payBillImagePath,
        title: 'Paypal USD',
        limit: '${Strings.limit.tr}: 1.00 -  100,000.00 USD',
        charge: '${Strings.charge.tr}: 2.00 USD + 1%',
        onTap: () {
          controller.navigateWithdrawMoneyScreen();
        },
      ),
      WithdrawMethodItemWidget(
        imagePath: Strings.payBillImagePath,
        title: 'Paypal USD',
        limit: '${Strings.limit.tr}: 1.00 -  100,000.00 USD',
        charge: '${Strings.charge.tr}: 2.00 USD + 1%',
        onTap: () {
          controller.navigateWithdrawMoneyScreen();
        },
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
