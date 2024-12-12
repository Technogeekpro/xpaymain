import 'package:get/get.dart';
import 'package:xpay/binding/onboard_binding.dart';
import 'package:xpay/views/auth/forget_password_screen.dart';
import 'package:xpay/views/auth/login_screen.dart';
import 'package:xpay/views/auth/otp_screen.dart';
import 'package:xpay/views/auth/sign_up_screen.dart';
import 'package:xpay/views/navigation_screen.dart';
import 'package:xpay/views/onboard/onboard_screen.dart';
import 'package:xpay/views/transactions_history/transactions_history.dart';
import 'package:xpay/views/welcome_screen.dart';

import '../binding/splash_binding.dart';
import '../views/add_money/add_money_screen.dart';
import '../views/add_money/confirm_screen.dart';
import '../views/add_money_history/add_money_history_screen.dart';
import '../views/auth/congratulations_screen.dart';
import '../views/auth/reset_password_screen.dart';
import '../views/currency_exchange/confirm_screen.dart';
import '../views/currency_exchange/currency_exchange_screen.dart';
import '../views/dashboard/dashboard_screen.dart';
import '../views/dashboard/scan_qr_code_screen.dart';
import '../views/dashboard/verify_account_screen.dart';
import '../views/invoice/confirm_screen.dart';
import '../views/invoice/create_invoice_screen.dart';
import '../views/invoice/invoice_preview_screen.dart';
import '../views/invoice/invoice_screen.dart';
import '../views/invoice/invoice_update_screen.dart';
import '../views/money_out/confirm_screen.dart';
import '../views/money_out/money_out_screen.dart';
import '../views/money_out/scan_qr_code_screen.dart';
import '../views/my_qr_code/my_qr_code_screen.dart';
import '../views/payment/confirm_screen.dart';
import '../views/payment/make_payment_screen.dart';
import '../views/payment/scan_qr_code_screen.dart';
import '../views/request_money/confirm_screen.dart';
import '../views/request_money/request_screen.dart';
import '../views/request_to_me/confirm_screen.dart';
import '../views/request_to_me/request_to_me_screen.dart';
import '../views/request_to_me/wallet_info_screen.dart';
import '../views/setting/change_language_screen.dart';
import '../views/setting/change_password_screen.dart';
import '../views/setting/setting_screen.dart';
import '../views/setting/two_fa_security_screen.dart';
import '../views/setting/update_profile_screen.dart';
import '../views/splash_screen/splash_screen.dart';
import '../views/support/create_support_ticket.dart';
import '../views/support/my_support_tickets_screen.dart';
import '../views/support/support_screen.dart';
import '../views/transfer_money/confirm_screen.dart';
import '../views/transfer_money/scan_qr_code_screen.dart';
import '../views/transfer_money/transfer_money_screen.dart';
import '../views/voucher/confirm_screen.dart';
import '../views/voucher/confirm_voucher_code_screen.dart';
import '../views/voucher/create_voucher_screen.dart';
import '../views/voucher/redeem_voucher_screen.dart';
import '../views/voucher/voucher_screen.dart';
import '../views/withdraw/add_withdraw_method_screen.dart';
import '../views/withdraw/confirm_screen.dart';
import '../views/withdraw/withdraw_method_screen.dart';
import '../views/withdraw/withdraw_money_screen.dart';
import '../views/withdraw_history/withdraw_history_screen.dart';

class Routes {
  static const String splashScreen = '/splashScreen';
  static const String onBoardScreen = '/onBoardScreen';
  static const String welcomeScreen = '/welcomeScreen';
  static const String loginScreen = '/loginScreen';
  static const String registerScreen = '/registerScreen';
  static const String forgetPasswordScreen = '/forgetPasswordScreen';
  static const String otpScreen = '/otpScreen';
  static const String resetPasswordScreen = '/resetPasswordScreen';
  static const String nidPassportScreen = '/nidPassportScreen';
  static const String congratulationsScreen = '/congratulationsScreen';
  static const String dashboardScreen = '/dashboardScreen';
  static const String navigationScreen = '/navigationScreen';
  static const String scanQeCodeScreen = '/scanQeCodeScreen';
  static const String addNumberSendMoneyScreen = '/addNumberSendMoneyScreen';
  static const String addAmountSendMoneyScreen = '/addAmountSendMoneyScreen';
  static const String pinScreen = '/pinScreen';
  static const String reviewSendMoneyScreen = '/reviewSendMoneyScreen';
  static const String confirmSendMoneyScreen = '/confirmSendMoneyScreen';
  static const String addNumberMobileRechargeScreen =
      '/addNumberMobileRechargeScreen';
  static const String addAmountMobileRechargeScreen =
      '/addAmountMobileRechargeScreen';
  static const String pinMobileRechargeScreen = '/pinMobileRechargeScreen';
  static const String reviewMobileRechargeScreen =
      '/reviewMobileRechargeScreen';
  static const String addNumberCashOutScreen = '/addNumberCashOutScreen';
  static const String addAmountCashOutScreen = '/addAmountCashOutScreen';
  static const String pinCashOutScreen = '/pinCashOutScreen';
  static const String reviewCashOutScreen = '/reviewCashOutScreen';
  static const String addNumberPaymentScreen = '/addNumberPaymentScreen';
  static const String addAmountPaymentScreen = '/addAmountPaymentScreen';
  static const String pinPaymentScreen = '/pinPaymentScreen';
  static const String reviewPaymentScreen = '/reviewPaymentScreen';
  static const String verifyAccountScreen = '/verifyAccountScreen';

  // add money
  static const String addSourceBankToXPayScreen = '/addSourceBankToXPayScreen';
  static const String bankToXPayAddMoneyScreen = '/bankToXPayAddMoneyScreen';
  static const String cardToXPayAddMoneyScreen = '/cardToXPayAddMoneyScreen';

  // bank to XPay
  static const String addBankBankToXPayScreen = '/addBankBankToXPayScreen';
  static const String addAccountAndAmountBankToXPayScreen =
      '/addAccountAndAmountBankToXPayScreen';
  static const String selectAccountBankToXPayScreen =
      '/selectAccountBankToXPayScreen';
  static const String reviewBankToXPayScreen = '/reviewBankToXPayScreen';
  static const String dynamicPasswordBankToXPayScreen =
      '/dynamicPasswordBankToXPayScreen';
  static const String confirmBankToXPayScreen = '/confirmBankToXPayScreen';

  // internet banking
  static const String addBankInternetBankingScreen =
      '/addBankInternetBankingScreen';
  static const String addAccountAndAmountInternetBankingScreen =
      '/addAccountAndAmountInternetBankingScreen';
  static const String selectAccountInternetBankingScreen =
      '/selectAccountInternetBankingScreen';
  static const String reviewInternetBankingScreen =
      '/reviewInternetBankingScreen';
  static const String dynamicPasswordInternetBankingScreen =
      '/dynamicPasswordInternetBankingScreen';
  static const String confirmInternetBankingScreen =
      '/confirmInternetBankingScreen';

  // card to XPay
  // mastercard
  static const String addAccountAndAmountCardToXPayScreen =
      '/addAccountAndAmountCardToXPayScreen';
  static const String selectCardCardToXPayScreen =
      '/selectCardCardToXPayScreen';
  static const String reviewCardToXPayScreen = '/reviewCardToXPayScreen';
  static const String dynamicPasswordCardToXPayScreen =
      '/dynamicPasswordCardToXPayScreen';
  static const String confirmCardToXPayScreen = '/confirmCardToXPayScreen';

  // mastercard
  static const String addAccountAndAmountCardToXPayVisaCardScreen =
      '/addAccountAndAmountCardToXPayVisaCardScreen';
  static const String selectCardCardToXPayVisaCardScreen =
      '/selectCardCardToXPayVisaCardScreen';
  static const String reviewCardToXPayVisaCardScreen =
      '/reviewCardToXPayVisaCardScreen';
  static const String dynamicPasswordCardToXPayVisaCardScreen =
      '/dynamicPasswordCardToXPayVisaCardScreen';
  static const String confirmCardToXPayVisaCardScreen =
      '/confirmCardToXPayVisaCardScreen';

  // pay bill
  static const String addOrganizationScreen = '/addOrganizationScreen';
  static const String prepaidTokenScreen = '/prepaidTokenScreen';

  // transfer money
  static const String addSourceTransferMoneyScreen =
      '/addSourceTransferMoneyScreen';
  static const String addBankTransferMoneyScreen =
      '/addBankTransferMoneyScreen';
  static const String selectCardTransferMoneyScreen =
      '/selectCardTransferMoneyScreen';
  static const String addAmountTransferMoneyScreen =
      '/addAmountTransferMoneyScreen';
  static const String pinTransferMoneyScreen = '/pinTransferMoneyScreen';

  static const String reviewTransferMoneyScreen = '/reviewTransferMoneyScreen';
  static const String confirmTransferMoneyScreen =
      '/confirmTransferMoneyScreen';

  // savings section
  static const String savingRulesScreen = '/savingRulesScreen';
  static const String schemeScreen = '/schemeScreen';
  static const String addTermAndFrequencyScreen = '/addTermAndFrequencyScreen';
  static const String depositAmountScreen = '/depositAmountScreen';
  static const String reviewSavingScreen = '/reviewSavingScreen';
  static const String confirmSavingScreen = '/confirmSavingScreen';
  static const String dataSavingScreen = '/dataSavingScreen';
  static const String dataShowScreen = '/dataShowScreen';
  static const String historySavingScreen = '/historySavingScreen';

  // remittance section
  static const String remittanceSourceScreen = '/remittanceSourceScreen';
  static const String addAmountRemittanceMoneyScreen =
      '/addAmountRemittanceMoneyScreen';
  static const String pinRemittanceScreen = '/pinRemittanceScreen';
  static const String reviewRemittanceScreen = '/reviewRemittanceScreen';

  // navigation screens
  static const String transactionsHistoryScreen = '/transactionsScreen';
  static const String dailyLimitScreen = '/dailyLimitScreen';
  static const String couponScreen = '/couponScreen';
  static const String informationUpdateScreen = '/informationUpdateScreen';
  static const String referToXPayScreen = '/referToXPayScreen';
  static const String xPayMapScreen = '/xPayMapScreen';
  static const String settingScreen = '/settingScreen';
  static const String changeNameScreen = '/changeNameScreen';
  static const String changePictureScreen = '/changePictureScreen';
  static const String liveChatScreen = '/liveChatScreen';
  static const String transferMoneyScanQrCodeScreen =
      '/transferMoneyScanQrCodeScreen';
  static const String addMoneyMoneyScreen = '/addMoneyMoneyScreen';
  static const String confirmAddMoneyScreen = '/confirmAddMoneyScreen';
  static const String transferMoneyScreen = '/transferMoneyScreen';
  static const String moneyOutScreen = '/moneyOutScreen';
  static const String moneyOutScanQrCodeScreen = '/moneyOutScanQrCodeScreen';
  static const String confirmMoneyOutScreen = '/confirmMoneyOutScreen';
  static const String makePaymentScreen = '/makePaymentScreen';
  static const String makePaymentScanQrCodeScreen =
      '/makePaymentScanQrCodeScreen';
  static const String confirmMakeMoneyOutScreen = '/confirmMakeMoneyOutScreen';
  static const String confirmMakePaymentOutScreen =
      '/confirmMakePaymentOutScreen';
  static const String requestScreen = '/requestScreen';
  static const String confirmRequestMoneyScreen = '/confirmRequestMoneyScreen';
  static const String currencyExchangeScreen = '/currencyExchangeScreen';
  static const String confirmCurrencyExchangeScreen =
      '/confirmCurrencyExchangeScreen';
  static const String voucherScreen = '/voucherScreen';
  static const String createVoucherScreen = '/createVoucherScreen';
  static const String confirmCreateVoucherOutScreen =
      '/confirmCreateVoucherOutScreen';
  static const String redeemVoucherScreen = '/redeemVoucherScreen';
  static const String confirmCreateVoucherCodeOutScreen =
      '/confirmCreateVoucherCodeOutScreen';
  static const String invoiceScreen = '/invoiceScreen';
  static const String createInvoiceScreen = '/createInvoiceScreen';
  static const String invoicePreviewScreen = '/invoicePreviewScreen';
  static const String confirmInvoiceScreen = '/confirmInvoiceScreen';
  static const String invoiceUpdateScreen = '/invoiceUpdateScreen';
  static const String withdrawScreen = '/withdrawScreen';
  static const String addWithdrawMethodScreen = '/addWithdrawMethodScreen';
  static const String withdrawMoneyScreen = '/withdrawMoneyScreen';
  static const String confirmWithdrawMoneyScreen =
      '/confirmWithdrawMoneyScreen';
  static const String requestToMeScreen = '/requestToMeScreen';
  static const String requestToMeWalletInfoScreen =
      '/requestToMeWalletInfoScreen';
  static const String confirmRequestToMeScreen = '/confirmRequestToMeScreen';
  static const String addMoneyHistoryScreen = '/addMoneyHistoryScreen';
  static const String withdrawHistoryScreen = '/withdrawHistoryScreen';
  static const String myQrCodeScreen = '/myQrCodeScreen';
  static const String settingsScreen = '/settingsScreen';
  static const String updateProfileScreen = '/updateProfileScreen';
  static const String changePasswordScreen = '/changePasswordScreen';
  static const String twoFaSecurity = '/twoFaSecurity';
  static const String supportScreen = '/supportScreen';
  static const String createSupportTicketScreen = '/createSupportTicketScreen';
  static const String mySupportTickets = '/mySupportTickets';
  static const String changeLanguageScreen = '/changeLanguageScreen';

  static var list = [
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: onBoardScreen,
      page: () => const OnboardScreen(),
      binding: OnBoardBinding(),
    ),
    GetPage(
      name: welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: registerScreen,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: forgetPasswordScreen,
      page: () => const ForgetPasswordScreen(),
    ),
    GetPage(
      name: otpScreen,
      page: () => const OtpScreen(),
    ),
    GetPage(
      name: resetPasswordScreen,
      page: () => const ResetPasswordScreen(),
    ),
    GetPage(
      name: congratulationsScreen,
      page: () => const CongratulationsScreen(),
    ),
    GetPage(
      name: dashboardScreen,
      page: () => DashboardScreen(),
    ),
    GetPage(
      name: navigationScreen,
      page: () => NavigationScreen(),
    ),
    GetPage(
      name: scanQeCodeScreen,
      page: () => const ScanQrCodeScreen(),
    ),
    GetPage(
      name: confirmTransferMoneyScreen,
      page: () => ConfirmTransferMoneyScreen(),
    ),
    GetPage(
      name: verifyAccountScreen,
      page: () => VerifyAccountScreen(),
    ),
    GetPage(
      name: transferMoneyScanQrCodeScreen,
      page: () => const TransferMoneyScanQrCodeScreen(),
    ),
    GetPage(
      name: addMoneyMoneyScreen,
      page: () => AddMoneyMoneyScreen(),
    ),
    GetPage(
      name: confirmAddMoneyScreen,
      page: () => ConfirmAddMoneyScreen(),
    ),
    GetPage(
      name: transferMoneyScreen,
      page: () => TransferMoneyScreen(),
    ),
    GetPage(
      name: moneyOutScreen,
      page: () => MoneyOutScreen(),
    ),
    GetPage(
      name: moneyOutScanQrCodeScreen,
      page: () => const MoneyOutScanQrCodeScreen(),
    ),
    GetPage(
      name: confirmMoneyOutScreen,
      page: () => ConfirmMoneyOutScreen(),
    ),
    GetPage(
      name: makePaymentScreen,
      page: () => MakePaymentScreen(),
    ),
    GetPage(
      name: makePaymentScanQrCodeScreen,
      page: () => const MakePaymentScanQrCodeScreen(),
    ),
    GetPage(
      name: confirmMakePaymentOutScreen,
      page: () => ConfirmMakePaymentOutScreen(),
    ),
    GetPage(
      name: requestScreen,
      page: () => RequestMoneyScreen(),
    ),
    GetPage(
      name: confirmRequestMoneyScreen,
      page: () => ConfirmRequestMoneyScreen(),
    ),
    GetPage(
      name: currencyExchangeScreen,
      page: () => CurrencyExchangeScreen(),
    ),
    GetPage(
      name: confirmCurrencyExchangeScreen,
      page: () => ConfirmCurrencyExchangeScreen(),
    ),
    GetPage(
      name: voucherScreen,
      page: () => VoucherScreen(),
    ),
    GetPage(
      name: createVoucherScreen,
      page: () => CreateVoucherScreen(),
    ),
    GetPage(
      name: confirmCreateVoucherOutScreen,
      page: () => ConfirmCreateVoucherOutScreen(),
    ),
    GetPage(
      name: redeemVoucherScreen,
      page: () => RedeemVoucherScreen(),
    ),
    GetPage(
      name: confirmCreateVoucherCodeOutScreen,
      page: () => ConfirmCreateVoucherCodeOutScreen(),
    ),
    GetPage(
      name: invoiceScreen,
      page: () => InvoiceScreen(),
    ),
    GetPage(
      name: createInvoiceScreen,
      page: () => CreateInvoiceScreen(),
    ),
    GetPage(
      name: invoicePreviewScreen,
      page: () => InvoicePreviewScreen(),
    ),
    GetPage(
      name: confirmInvoiceScreen,
      page: () => ConfirmInvoiceScreen(),
    ),
    GetPage(
      name: invoiceUpdateScreen,
      page: () => InvoiceUpdateScreen(),
    ),
    GetPage(
      name: withdrawScreen,
      page: () => WithdrawScreen(),
    ),
    GetPage(
      name: addWithdrawMethodScreen,
      page: () => AddWithdrawMethodScreen(),
    ),
    GetPage(
      name: withdrawMoneyScreen,
      page: () => WithdrawMoneyScreen(),
    ),
    GetPage(
      name: confirmWithdrawMoneyScreen,
      page: () => ConfirmWithdrawMoneyScreen(),
    ),
    GetPage(
      name: requestToMeScreen,
      page: () => RequestToMeScreen(),
    ),
    GetPage(
      name: transactionsHistoryScreen,
      page: () => TransactionsHistory(),
    ),
    GetPage(
      name: requestToMeWalletInfoScreen,
      page: () => RequestToMeWalletInfoScreen(),
    ),
    GetPage(
      name: confirmRequestToMeScreen,
      page: () => ConfirmRequestToMeScreen(),
    ),
    GetPage(
      name: addMoneyHistoryScreen,
      page: () => AddMoneyHistoryScreen(),
    ),
    GetPage(
      name: withdrawHistoryScreen,
      page: () => WithdrawHistoryScreen(),
    ),
    GetPage(
      name: myQrCodeScreen,
      page: () => const MyQrCodeScreen(),
    ),
    GetPage(
      name: settingsScreen,
      page: () => const SettingsScreen(),
    ),
    GetPage(
      name: updateProfileScreen,
      page: () => UpdateProfileScreen(),
    ),
    GetPage(
      name: changePasswordScreen,
      page: () => const ChangePasswordScreen(),
    ),
    GetPage(
      name: twoFaSecurity,
      page: () => TwoFaSecurity(),
    ),
    GetPage(
      name: supportScreen,
      page: () => const SupportScreen(),
    ),
    GetPage(
      name: createSupportTicketScreen,
      page: () => CreateSupportTicketScreen(),
    ),
    GetPage(
      name: mySupportTickets,
      page: () => MySupportTickets(),
    ),
    GetPage(
      name: changeLanguageScreen,
      page: () => ChangeLanguageScreen(),
    ),
  ];
}
