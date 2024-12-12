import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xpay/widgets/buttons/primary_button.dart';

import '../../controller/settings_controller.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/local_storage.dart';
import '../../utils/strings.dart';
import '../../widgets/primary_appbar.dart';
import '../../widgets/size_widget.dart';

class ChangeLanguageScreen extends StatelessWidget {
  ChangeLanguageScreen({Key? key}) : super(key: key);

  final _controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.secondaryColor,
      appBar: PrimaryAppBar(
        appbarSize: Dimensions.defaultAppBarHeight,
        toolbarHeight: Dimensions.defaultAppBarHeight,
        title: Text(
          Strings.changeLanguage.tr,
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
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      children: [
        addVerticalSpace(20.h),
        _changeLanguageWidget(context),
        SizedBox(
          height: Dimensions.heightSize,
        ),
        _submitButtonWidget(context)
      ],
    );
  }

  _submitButtonWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.marginSize),
      child: PrimaryButton(
        title: Strings.submit.tr,
        onPressed: () {
          if (_controller.selectedLanguage.value == Strings.arabic) {
            LocalStorage.saveLanguage(langSmall: 'ar', langCap: 'AR');
          } else if (_controller.selectedLanguage.value == Strings.english) {
            LocalStorage.saveLanguage(langSmall: 'us', langCap: 'US');
          } else if (_controller.selectedLanguage.value == Strings.spanish) {
            LocalStorage.saveLanguage(langSmall: 'sp', langCap: 'SP');
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Please Select a language"),
            ));
          }
        },
      ),
    );
  }

  _changeLanguageWidget(BuildContext context) {
    return Column(
      children: [
        _selectLanguageWidget(
            context, Strings.arabicImage, Strings.arabic, Strings.arabic),
        _selectLanguageWidget(
            context, Strings.englishImage, Strings.english, Strings.english),
        _selectLanguageWidget(
            context, Strings.spanishImage, Strings.spanish, Strings.spanish),
      ],
    );
  }

  _selectLanguageWidget(
      BuildContext context, String image, String name, String buttonIndex) {
    return Container(
      height: Dimensions.heightSize * 4.5,
      margin: EdgeInsets.symmetric(
          horizontal: Dimensions.marginSize,
          vertical: Dimensions.marginSize * 0.2),
      padding: EdgeInsets.all(Dimensions.defaultPaddingSize * 0.5),
      decoration: BoxDecoration(
          color: CustomColor.primaryColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
          border: Border.all(color: Theme.of(context).secondaryHeaderColor)),
      child: Row(
        mainAxisAlignment: mainSpaceBet,
        children: [
          Row(
            children: [
              SizedBox(
                  height: 40,
                  width: 50,
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  )),
              addHorizontalSpace(10.w),
              Text(
                name.tr,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: CustomColor.primaryTextColor,
                  // fontSize: 20,
                ),
              ),
            ],
          ),
          Obx(
            () => Radio(
              activeColor: CustomColor.primaryTextColor,
              // hoverColor: CustomColor.secondaryColor,

              value: buttonIndex,
              groupValue: _controller.selectedLanguage.value,
              onChanged: (value) {
                _controller.onChangeLanguage(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
