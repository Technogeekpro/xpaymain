import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:xpay/firebase_options.dart';
import 'package:xpay/routes/routes.dart';
import 'package:xpay/utils/language/local_strings.dart';
import 'package:xpay/views/auth/login_vm.dart';
import 'package:xpay/views/auth/wallet_view_model.dart';

import 'utils/custom_color.dart';
import 'utils/strings.dart';
import 'views/auth/user_provider.dart';

void main() async {
  // Locking Device Orientation
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await GetStorage.init(); // initializing getStorage
  // main app
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<LoginViewModel>(
        create: (context) => LoginViewModel()),
    ChangeNotifierProvider(create: (_) => UserProvider()),
    ChangeNotifierProvider(create: (_) => WalletViewModel())
  ], child: const MyApp()));
}

// This widget is the root of your application.
//My name is Abdul Razak 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (_, child) => GetMaterialApp(
        title: Strings.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: CustomColor.primaryColor,
            useMaterial3: false,
            textTheme:
                GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
            appBarTheme: const AppBarTheme(color: CustomColor.primaryColor)),
        navigatorKey: Get.key,
        initialRoute: Routes.splashScreen,
        getPages: Routes.list,
        builder: (context, widget) {
          ScreenUtil.init(context);
          return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: TextScaler.linear(1.0)),
              child: widget!);
        },
        translations: LocalString(),
        locale: Locale('en', 'US'),
      ),
    );
  }
}
