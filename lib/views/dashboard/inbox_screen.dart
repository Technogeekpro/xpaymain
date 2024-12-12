import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/inbox_transaction_widget.dart';
import '../../widgets/notification_widget.dart';
import '../../widgets/primary_appbar.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: CustomColor.screenBGColor,
          appBar: PrimaryAppBar(
            appbarSize: Dimensions.defaultAppBarHeight * 1.9,
            title: Text(
              Strings.inbox.tr,
              style: CustomStyle.commonTextTitleWhite,
            ),
            appBar: AppBar(),
            backgroundColor: CustomColor.primaryColor,
            autoLeading: false,
            elevation: 1,
            action: [
              Row(
                children: [
                  Image.asset(
                    Strings.appbarLogoPath,
                    // scale: 4,
                  ),
                  SizedBox(
                    width: Dimensions.widthSize * 1.7,
                  ),
                ],
              )
            ],
            // toolbarHeight: 100,
            bottom: PreferredSize(
              preferredSize: _tabBarWidget.preferredSize,
              child: ColoredBox(
                color: CustomColor.secondaryColor,
                child: _tabBarWidget,
              ),
            ),
            appbarColor: CustomColor.secondaryColor,
          ),
          body: TabBarView(
            physics: const BouncingScrollPhysics(),
            children: [
              _notificationsSection(context),
              _transactionsSection(context),
            ],
          ),
        ),
      );

  _notificationsSection(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: _notificationBodyWidget(context),
        ),
      ],
    );
  }

  _transactionsSection(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        SizedBox(
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          child: _transactionsBodyWidget(context),
        ),
      ],
    );
  }

  // body widget containing all widget elements
  _notificationBodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.marginSize - 5,
        right: Dimensions.marginSize - 5,
        top: Dimensions.marginSize - 5,
      ),
      child: Column(
        children: [
          _notificationCardWidget(context),
        ],
      ),
    );
  }

  // tab bar widget
  TabBar get _tabBarWidget => TabBar(
        labelColor: CustomColor.primaryColor,
        labelStyle: CustomStyle.commonTextTitle,
        unselectedLabelColor: Colors.white.withOpacity(0.5),
        unselectedLabelStyle: CustomStyle.commonTextTitle,
        tabs: [
          Tab(
            child: Text(Strings.notifications.tr),
          ),
          Tab(
            child: Text(Strings.transactions.tr),
          ),
        ],
      );

  // notification widget card
  _notificationCardWidget(BuildContext context) {
    List<NotificationCardWidget> notificationCardList = [
      const NotificationCardWidget(
        imagePath: 'assets/images/contact_icon.png',
        title: 'Added fund to USD wallet',
        dateAndTime: '11:28 AM - 3/1/2022',
        subTitle: 'Payment by Paypal',
      ),
    ];
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.4,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: notificationCardList.length,
        itemBuilder: (context, index) => notificationCardList[index],
        separatorBuilder: (BuildContext context, int index) => const Padding(
          padding: EdgeInsets.only(bottom: 10),
        ),
      ),
    );
  }

  // transaction tab section
  _transactionsBodyWidget(BuildContext context) {
    List<TransactionsWidget> transactionList = [
      const TransactionsWidget(
        imagePath: Strings.payBillImagePath,
        title: 'Money Out',
        dateAndTime: '11:28 AM - 3/1/2022',
        phoneNumber: '+1 659 689 6895',
        subTitle: 'Money Out to testagent',
        amount: '1400.00',
        isMoneyOut: true,
      ),
      const TransactionsWidget(
        imagePath: Strings.payBillImagePath,
        title: 'Money In',
        dateAndTime: '11:28 AM - 3/1/2022',
        phoneNumber: '+1 659 689 6895',
        subTitle: 'Money In from adsent',
        amount: '1400.00',
        isMoneyOut: false,
      ),
      const TransactionsWidget(
        imagePath: Strings.payBillImagePath,
        title: 'Transfer Money',
        dateAndTime: '11:28 AM - 3/1/2022',
        phoneNumber: '+1 659 689 6895',
        subTitle: 'Transfer Money to adsent',
        amount: '1400.00',
        isMoneyOut: true,
      ),
    ];

    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.4,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: transactionList.length,
        itemBuilder: (context, index) => transactionList[index],
        separatorBuilder: (BuildContext context, int index) => const Padding(
          padding: EdgeInsets.only(bottom: 0),
        ),
      ),
    );
  }
}
