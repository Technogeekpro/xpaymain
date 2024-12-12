import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:xpay/data/request_money_model.dart';
import 'package:xpay/utils/utils.dart';
import 'package:xpay/views/auth/user_provider.dart';

import '../../routes/routes.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/primary_appbar.dart';
import '../../widgets/request_to_me_item_widget.dart';
import '../auth/wallet_view_model.dart';

class RequestToMeScreen extends StatefulWidget {
  RequestToMeScreen({Key? key}) : super(key: key);

  @override
  State<RequestToMeScreen> createState() => _RequestToMeScreenState();
}

class _RequestToMeScreenState extends State<RequestToMeScreen> {
  late final WalletViewModel _walletViewModel;
  late final UserProvider _userProvider;

  @override
  Widget build(BuildContext context) {
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
      body: Consumer<WalletViewModel>(
        builder: (context, walletViewModel, child) {
          if (walletViewModel.requests.isEmpty) {
            return Center(
              child: Text(
                'No data available', // Update this message as needed
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: walletViewModel.requests.length,
            itemBuilder: (context, index) {
              RequestMoneyModel request = walletViewModel.requests[index];
              bool isSender =
                  request.receiverEmail != _userProvider.user?.emailAddress;

              return RequestToMeItemWidget(
                imagePath: Strings.payBillImagePath,
                title: isSender ? request.receiverEmail! : request.senderEmail!,
                dateAndTime: Utils.formatDateTime(request.requestedAt),
                subTitle: '${request.amount} ${request.currency}',
                isAccepted: request.status == 'accepted',
                isRejected: request.status == 'rejected',
                isCanceled: request.status == 'canceled',
                onTap: () {
                  if (request.status! != 'canceled') {
                    _handleRequestTap(request, isSender);
                  }
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Get.toNamed(Routes.requestScreen);
          _fetchRequests();
        },
        child: Icon(Icons.add, color: CustomColor.primaryColor),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _walletViewModel = Provider.of<WalletViewModel>(context, listen: false);
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    _fetchRequests();
  }

  Future<void> _fetchRequests() async {
    await _walletViewModel.fetchRequests();
  }

  void _handleRequestTap(RequestMoneyModel request, bool isSender) async {
    try {
      if (isSender) {
        if (request.status! != 'accepted') {
          Utils.showConfirmationDialogActions(
            context,
            'Cancel Request',
            'Are you sure you want to cancel this request?',
            'Cancel Request',
            'No, keep request',
            () async {
              if (context.mounted) {
                Utils.showLoadingDialog(context);
                try {
                  await _walletViewModel.cancelRequest(request);
                  Navigator.of(context).pop();
                } catch (e) {
                  Navigator.of(context).pop();
                  Utils.showDialogMessage(
                      context, 'Error', 'Failed to cancel request: $e');
                }
              }
            },
            () {},
          );
        }
      } else if (request.status != 'rejected' && request.status != 'accepted') {
        Utils.showConfirmationDialogActions(
          context,
          'Accept Request?',
          'On clicking accept amount of ${request.amount} will be debited from your wallet',
          'Accept',
          'Reject',
          () async {
            if (context.mounted) {
              Utils.showLoadingDialog(context);
              try {
                await _walletViewModel.sendMoneyToUser(
                  request.senderEmail!,
                  request.amount!,
                  request.currency!,
                );
                await _walletViewModel.acceptRequest(request);
                await _userProvider.fetchUserDetails();
                Navigator.of(context).pop();
              } catch (e) {
                Navigator.of(context).pop();
                Utils.showDialogMessage(
                    context, 'Error', 'Failed to accept request: $e');
              }
            }
          },
          () async {
            if (context.mounted) {
              Utils.showLoadingDialog(context);
              try {
                await _walletViewModel.declineRequest(request);
                Navigator.of(context).pop();
              } catch (e) {
                Navigator.of(context).pop();
                Utils.showDialogMessage(
                    context, 'Error', 'Failed to decline request: $e');
              }
            }
          },
        );
      }
    } catch (e) {
      Utils.showDialogMessage(
          context, 'Error', 'Unexpected error occurred: $e');
    }
  }
}
