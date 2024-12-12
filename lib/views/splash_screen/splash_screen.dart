import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:xpay/routes/routes.dart';
import 'package:xpay/utils/storage_service.dart';
import 'package:xpay/views/auth/user_provider.dart';

import '../../utils/custom_color.dart';
import '../../utils/strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final UserProvider _userProvider;
  final _storageService = StorageService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.splashScreenColor,
      body: Center(
        child: Image.asset(Strings.splashScreenImagePath),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    _checkSession();
  }

  void _checkSession() async {
    bool isLoggedIn =
        await _storageService.getValue(Strings.isLoggedIn) ?? false;
    if (isLoggedIn) {
      await _userProvider.fetchUserDetails();
      Get.offAllNamed(Routes.dashboardScreen);
    } else {
      Timer(
        const Duration(seconds: 3),
        () => Get.offAllNamed(Routes.onBoardScreen),
      );
    }
  }
}
