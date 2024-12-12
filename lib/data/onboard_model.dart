import 'package:xpay/utils/strings.dart';

class OnboardModel {
  final String imagePath;
  final String title;

  OnboardModel({required this.imagePath, required this.title});
}

List<OnboardModel> onBoardModePages = [
  OnboardModel(
    title: Strings.onboardText1,
    imagePath: Strings.onboardImagePath1,
  ),
  OnboardModel(
    title: Strings.onboardText2,
    imagePath: Strings.onboardImagePath2,
  ),
  OnboardModel(
    title: Strings.onboardText3,
    imagePath: Strings.onboardImagePath3,
  ),
];
