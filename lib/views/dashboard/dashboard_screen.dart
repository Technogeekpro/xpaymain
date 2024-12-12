import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:xpay/views/auth/user_provider.dart';
import 'package:xpay/widgets/primary_appbar.dart';

import '../../controller/dashboard_controller.dart';
import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/dashboard_option_widget.dart';
import '../../widgets/navigation_drawer_widget.dart';
import '../../widgets/slider_widget.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<SliderWidget> sliderList = [
    const SliderWidget(),
    const SliderWidget(),
    const SliderWidget(),
    const SliderWidget(),
  ];

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
        title: _appbarTopWidget(context, controller),
        action: [
          Builder(
              builder: (context) => Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Scaffold.of(context)
                              .openEndDrawer(); // added method to open the end drawer
                        },
                        child: Image.asset(
                          Strings.appbarLogoPath,
                          // scale: 4,
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.widthSize * 1.7,
                      ),
                    ],
                  ))
        ],
        appbarSize: Dimensions.defaultAppBarHeight * 1.5,
        toolbarHeight: Dimensions.defaultAppBarHeight * 1.5,
      ),
      endDrawer: const NavigationDrawerWidget(),
      backgroundColor: CustomColor.screenBGColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _myXPayWidget(context, controller),
          //  Expanded(child: Image.asset(Strings.dpLogo))
        ],
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
          children: [
            //   _verificationInfoWidget(context, controller, true),
            //   _middleSliderWidget(context, controller),
            _myXPayWidget(context, controller),
            Image.asset(Strings.splashScreenImagePath)
          ],
        ),
      ],
    );
  }

  // this appbar widget lives inside the appbar
  _appbarTopWidget(BuildContext context, DashboardController controller) {
    return Consumer<UserProvider>(
      builder:
          (BuildContext context, UserProvider userProvider, Widget? child) {
        return Obx(
          () => Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              (userProvider.user!.profilePhoto!.isNotEmpty &&
                      userProvider.user!.profilePhoto != null)
                  ? CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          NetworkImage(userProvider.user!.profilePhoto!))
                  : SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        Strings.appbarQLogoPath,
                        fit: BoxFit.cover,
                      ),
                    ),
              SizedBox(
                width: Dimensions.widthSize,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userProvider.user!.firstName,
                    style: TextStyle(
                      color: CustomColor.primaryTextColor,
                      fontSize: Dimensions.smallestTextSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.heightSize,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius * 5),
                      ),
                      height: 30,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 1200),
                        child: controller.showBalance.value
                            ? Container(
                                key: const Key('1'),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.changeBalanceStatus();
                                  },
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.monetization_on,
                                        color: CustomColor.primaryColor,
                                      ),
                                      Expanded(
                                        child: Text(
                                          Strings.tapForBalance.tr,
                                          style: TextStyle(
                                            color: CustomColor.primaryColor,
                                            fontSize:
                                                Dimensions.smallestTextSize,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : Container(
                                key: const Key('2'),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.changeBalanceStatus();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Consumer<UserProvider>(
                                        builder:
                                            (context, userProvider, child) {
                                          double balance = userProvider.user
                                                  ?.walletBalances['USD'] ??
                                              0.0;
                                          return Text(
                                            balance.toString(),
                                            style: TextStyle(
                                              color: CustomColor.primaryColor,
                                              fontSize:
                                                  Dimensions.smallestTextSize,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          );
                                        },
                                      ),
                                      const Icon(
                                        Icons.monetization_on,
                                        color: CustomColor.primaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      )),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  // my xPay section with other options and view all button
  _myXPayWidget(BuildContext context, DashboardController controller) {
    return Container(
      padding: EdgeInsets.all(Dimensions.defaultPaddingSize * 0.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DashboardOptionWidget(
                imagePath: Strings.addMoneyImagePath,
                title: Strings.addMoney.tr,
                onTap: () {
                  controller.navigateToAddMoneyScreen();
                },
              ),
              DashboardOptionWidget(
                imagePath: Strings.cashOutImagePath,
                title: Strings.moneyOut.tr,
                onTap: () {
                  controller.navigateToMoneyOutScreen();
                },
              ),
              // DashboardOptionWidget(
              //   imagePath: Strings.shoppingImagePath,
              //   title: Strings.makePayment.tr,
              //   onTap: () {
              //     controller.navigateToMakePaymentScreen();
              //   },
              // ),
              // DashboardOptionWidget(
              //   imagePath: Strings.sendMoneyImagePath,
              //   title: Strings.transfer.tr,
              //   onTap: () {
              //     controller.navigateToTransferMoneyScreen();
              //   },
              // ),
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     DashboardOptionWidget(
          //       imagePath: Strings.requestImagePath,
          //       title: Strings.request.tr,
          //       onTap: () {
          //         controller.navigateToRequestScreen();
          //       },
          //     ),
          //     DashboardOptionWidget(
          //       imagePath: Strings.exchangeImagePath,
          //       title: Strings.exchange.tr,
          //       onTap: () {
          //         controller.navigateToCurrencyExchangeScreen();
          //       },
          //     ),
          //     DashboardOptionWidget(
          //       imagePath: Strings.voucherImagePath,
          //       title: Strings.createVoucher.tr,
          //       onTap: () {
          //         controller.navigateToVoucherScreen();
          //       },
          //     ),
          //     DashboardOptionWidget(
          //       imagePath: Strings.invoiceImagePath,
          //       title: Strings.invoice.tr,
          //       onTap: () {
          //         controller.navigateToInvoiceScreen();
          //       },
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  // middle slider widget made with Carousel slider and smooth page indicator
  _middleSliderWidget(BuildContext context, DashboardController controller) {
    return Container(
      padding: EdgeInsets.only(bottom: Dimensions.defaultPaddingSize * 0.5),
      color: CustomColor.secondaryColor,
      child: Obx(
        () => Center(
          child: Column(
            children: [
              CarouselSlider.builder(
                itemCount: sliderList.length,
                itemBuilder: (context, index, realIndex) {
                  return _buildSlider(context, index);
                },
                options: CarouselOptions(
                    enlargeCenterPage: true,
                    viewportFraction: 0.70,
                    height: MediaQuery.of(context).size.height / 4,
                    onPageChanged: (index, reason) =>
                        controller.changeIndicator(index)),
              ),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              _buildIndicator(context, controller),
            ],
          ),
        ),
      ),
    );
  }

  // for slider banner
  _buildSlider(BuildContext context, int index) {
    return sliderList[index];
  }

  // for slider dot indicator
  _buildIndicator(BuildContext context, DashboardController controller) {
    return AnimatedSmoothIndicator(
      activeIndex: controller.activeIndex.value,
      count: sliderList.length,
      effect: SlideEffect(
        dotHeight: 8,
        dotWidth: 8,
        activeDotColor: CustomColor.primaryColor,
        dotColor: Colors.grey.withOpacity(0.5),
      ),
    );
  }

  _verificationInfoWidget(
      BuildContext context, DashboardController controller, bool isPending) {
    return Container(
      decoration: const BoxDecoration(color: CustomColor.secondaryColor),
      child: Container(
        margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
        padding: const EdgeInsets.only(left: 10, right: 10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: CustomColor.screenBGColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(Dimensions.radius * 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.idCard,
                  color: CustomColor.primaryColor,
                  size: Dimensions.iconSizeDefault,
                ),
                SizedBox(
                  width: Dimensions.widthSize,
                ),
              ],
            ),
            Expanded(
              child: Text(
                Strings.verificationSubmitInfo.tr,
                style: TextStyle(
                  color: CustomColor.primaryTextColor.withOpacity(0.8),
                  fontSize: Dimensions.smallestTextSize * 0.7,
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              width: Dimensions.widthSize * 7,
              height: Dimensions.heightSize * 2,
              child: ElevatedButton(
                onPressed: () {
                  controller.navigateToVerifyAccountScreen();
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    isPending
                        ? const Color(0xffff8e2c)
                        : CustomColor.primaryColor,
                  ),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius * 2),
                    ),
                  ),
                ),
                child: Text(
                  isPending ? Strings.pending.tr : Strings.submit.tr,
                  style: TextStyle(
                    fontSize: Dimensions.smallestTextSize * 0.7,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
