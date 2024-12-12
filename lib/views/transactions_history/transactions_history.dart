import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:xpay/data/transaction_model.dart';
import 'package:xpay/utils/custom_color.dart';
import 'package:xpay/utils/custom_style.dart';
import 'package:xpay/utils/dimensions.dart';
import 'package:xpay/utils/strings.dart';
import 'package:xpay/views/auth/wallet_view_model.dart';
import 'package:xpay/widgets/details_transaction_widget.dart';
import 'package:xpay/widgets/latest_transaction_widget.dart';
import 'package:xpay/widgets/primary_appbar.dart';

class TransactionsHistory extends StatefulWidget {
  const TransactionsHistory({super.key});

  @override
  State<TransactionsHistory> createState() => _TransactionsHistoryState();
}

class _TransactionsHistoryState extends State<TransactionsHistory> {
  late final WalletViewModel? _walletViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.screenBGColor,
      appBar: PrimaryAppBar(
        appbarSize: Dimensions.defaultAppBarHeight,
        toolbarHeight: Dimensions.defaultAppBarHeight,
        title: Text(
          'Transactions History',
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
      body:
          Consumer<WalletViewModel>(builder: (context, walletViewModel, child) {
        if (walletViewModel.transactions.isEmpty) {
          return Center(
              child: Text('No Transactions Found',
                  style: CustomStyle.commonTextTitleWhite));
        }
        return ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: walletViewModel.transactions.length,
          itemBuilder: (context, index) {
            TransactionModel transaction = walletViewModel.transactions[index];
            return ExpansionTile(
              trailing: SizedBox(),
              title: TransactionsItemWidget(
                imagePath: transaction.type == 'add'
                    ? Strings.addMoneyImagePath
                    : Strings.withdrawMoneyImagePath,
                title: transaction.type == 'add'
                    ? 'Added Money'
                    : 'Withdrew Money',
                dateAndTime:
                    '${transaction.timestamp.hour}:${transaction.timestamp.minute} - ${transaction.timestamp.day}/${transaction.timestamp.month}/${transaction.timestamp.year}',
                phoneNumber: '',
                // If phone number is not available, you can remove this or use some placeholder
                transactionId: transaction.transactionId,
                amount: '${transaction.amount} ${transaction.currency}',
                isMoneyOut: transaction.type == 'withdraw',
              ),
              children: [
                DetailsTransactionWidget(
                  transactionId: transaction.transactionId,
                  wallet: transaction.currency,
                  beforeCharge: '',
                  // Add logic for beforeCharge if available
                  charge: '',
                  // Add logic for charge if available
                  transactedAmount:
                      '${transaction.amount} ${transaction.currency}',
                  remainingBalance:
                      '', // Add logic for remainingBalance if available
                )
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Padding(
            padding: EdgeInsets.only(bottom: 0),
          ),
        );
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    _walletViewModel = Provider.of<WalletViewModel>(context, listen: false);
    _fetchTransactionHistory();
  }

  void _fetchTransactionHistory() async {
    await _walletViewModel!.fetchTransactionHistory();
  }
}
