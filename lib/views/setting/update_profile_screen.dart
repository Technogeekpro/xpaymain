import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:xpay/utils/utils.dart';

import '../../controller/settings_controller.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/image_picker_widget.dart';
import '../../widgets/inputs/phone_number_with_contry_code_input.dart';
import '../../widgets/inputs/text_field_input_widget.dart';
import '../../widgets/inputs/text_label_widget.dart';
import '../../widgets/primary_appbar.dart';
import '../../widgets/snackbar/custom_snackbar.dart';
import '../auth/user_provider.dart';

class UpdateProfileScreen extends StatefulWidget {
  UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final formKey = GlobalKey<FormState>();

  late final UserProvider _userProvider;
  late final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.screenBGColor,
      appBar: PrimaryAppBar(
        appbarSize: Dimensions.defaultAppBarHeight,
        toolbarHeight: Dimensions.defaultAppBarHeight,
        title: Text(
          Strings.updateProfile.tr,
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
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: _bodyWidget(context, settingsController),
      ),
    );
  }

  // body widget contain all the widgets
  _bodyWidget(BuildContext context, SettingsController controller) {
    return ListView(
      shrinkWrap: true,
      children: [
        Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.30,
            width: MediaQuery.of(context).size.width * 0.30,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: MediaQuery.of(context).size.height * 0.30,
                    width: MediaQuery.of(context).size.width * 0.30,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) =>
                              _imagePickerBottomSheetWidget(context),
                        );
                      },
                      child: _getProfileImageWidget(),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 38,
                  left: 50,
                  child: GestureDetector(
                    child: Icon(
                      Icons.photo_camera,
                      color: Colors.white,
                      size: Dimensions.iconSizeDefault,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        _updateProfileInputWidget(context, controller),
        _buttonWidget(context, controller),
        SizedBox(
          height: Dimensions.heightSize,
        ),
      ],
    );
  }

  _updateProfileInputWidget(
      BuildContext context, SettingsController controller) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: CustomColor.secondaryColor,
        borderRadius: BorderRadius.circular(Dimensions.radius * 2),
      ),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextLabelWidget(text: Strings.firstName.tr),
            TextFieldInputWidget(
              readOnly: true,
              controller: controller.firstNameController,
              hintText: Strings.firstNameHint.tr,
              borderColor: CustomColor.primaryColor,
              color: CustomColor.secondaryColor,
            ),
            SizedBox(
              height: Dimensions.heightSize,
            ),
            TextLabelWidget(text: Strings.lastName.tr),
            TextFieldInputWidget(
              readOnly: true,
              controller: controller.lastNameController,
              hintText: Strings.lastNameHint.tr,
              borderColor: CustomColor.primaryColor,
              color: CustomColor.secondaryColor,
            ),
            SizedBox(
              height: Dimensions.heightSize,
            ),
            TextLabelWidget(text: Strings.emailAddress.tr),
            TextFieldInputWidget(
              readOnly: true,
              controller: controller.emailController,
              hintText: Strings.emailAddress.tr,
              borderColor: CustomColor.primaryColor,
              color: CustomColor.secondaryColor,
            ),
            SizedBox(
              height: Dimensions.heightSize,
            ),
            TextLabelWidget(text: Strings.mobile.tr),
            PhoneNumberWithCountryCodeInput(
              readOnly: true,
              controller: controller.mobileController,
            ),
            SizedBox(
              height: Dimensions.heightSize,
            ),
            TextLabelWidget(text: Strings.address.tr),
            TextFieldInputWidget(
              validator:
                  RequiredValidator(errorText: 'Please enter an address'),
              controller: controller.addressController,
              hintText: Strings.addressHint.tr,
              borderColor: CustomColor.primaryColor,
              color: CustomColor.secondaryColor,
            ),
            SizedBox(
              height: Dimensions.heightSize,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      TextLabelWidget(text: Strings.state.tr),
                      TextFieldInputWidget(
                        validator: RequiredValidator(
                            errorText: 'Please enter a State'),
                        controller: controller.stateController,
                        hintText: Strings.state.tr,
                        borderColor: CustomColor.primaryColor,
                        color: CustomColor.secondaryColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: Dimensions.widthSize,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      TextLabelWidget(text: Strings.city.tr),
                      TextFieldInputWidget(
                        validator:
                            RequiredValidator(errorText: 'Please enter a City'),
                        controller: controller.cityController,
                        hintText: Strings.city.tr,
                        borderColor: CustomColor.primaryColor,
                        color: CustomColor.secondaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.heightSize,
            ),
            Column(
              children: [
                TextLabelWidget(text: Strings.zip.tr),
                TextFieldInputWidget(
                  controller: controller.zipController,
                  keyboardType: TextInputType.number,
                  validator:
                      RequiredValidator(errorText: 'Please enter a ZIP CODE'),
                  hintText: Strings.zip.tr,
                  borderColor: CustomColor.primaryColor,
                  color: CustomColor.secondaryColor,
                ),
                SizedBox(
                  width: Dimensions.widthSize,
                ),
              ],
            ),
            SizedBox(
              width: Dimensions.widthSize,
            ),
            Column(
              children: [
                SizedBox(
                  height: Dimensions.heightSize,
                ),
                // TextLabelWidget(text: Strings.country.tr),
                // ProfileCountryCodePickerWidget(
                //   hintText: 'Select Country',
                //   controller: controller.countryController,
                // ),
                // Divider(
                //   thickness: 1.5,
                //   color: CustomColor.primaryColor.withOpacity(0.5),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //  Button widget
  _buttonWidget(BuildContext context, SettingsController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: PrimaryButton(
        title: Strings.update.tr,
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            Utils.showLoadingDialog(context);
            try {
              Map<String, dynamic> updatedFields = await _getUpdatedFields();

              if (updatedFields.isNotEmpty) {
                await _userProvider.updateUserDetails(updatedFields);
                if (context.mounted) {
                  Navigator.pop(context);
                  Utils.showDialogMessage(
                      context, 'Success', 'Profile Updated!');
                  controller.userPhoto = null;
                }
              } else {
                if (context.mounted) {
                  Navigator.pop(context);
                  Utils.showDialogMessage(
                      context, 'Info', 'No changes to update.');
                }
              }
            } catch (e) {
              if (context.mounted) {
                Navigator.pop(context);
                Utils.showDialogMessage(
                    context, 'Error', 'Failed to update profile: $e');
              }
            }
          }
        },
        borderColorName: CustomColor.primaryColor,
      ),
    );
  }

  _profileImageWidget(BuildContext context) {
    return ImagePickerWidget();
  }

  @override
  void initState() {
    super.initState();
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    settingsController = Get.put(SettingsController());
    if (_userProvider.user != null) {
      settingsController.bindData(_userProvider.user!);
    }
  }

  _imagePickerBottomSheetWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.15,
      margin: EdgeInsets.all(Dimensions.marginSize * 0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(Dimensions.defaultPaddingSize),
            child: IconButton(
                onPressed: () {
                  pickImage(ImageSource.gallery);
                },
                icon: const Icon(
                  Icons.image,
                  color: CustomColor.primaryColor,
                  size: 50,
                )),
          ),
          Padding(
            padding: EdgeInsets.all(Dimensions.defaultPaddingSize),
            child: IconButton(
                onPressed: () {
                  pickImage(ImageSource.camera);
                },
                icon: const Icon(
                  Icons.camera,
                  color: CustomColor.primaryColor,
                  size: 50,
                )),
          ),
        ],
      ),
    );
  }

  Future pickImage(ImageSource imageSource) async {
    try {
      final image =
          await ImagePicker().pickImage(source: imageSource, imageQuality: 100);
      if (image == null) return;
      setState(() {
        settingsController.userPhoto = File(image.path);
      });
    } on PlatformException catch (e) {
      CustomSnackBar.error('Error: $e');
    }
  }

  Future<Map<String, dynamic>> _getUpdatedFields() async {
    Map<String, dynamic> updatedFields = {};

    if (settingsController.addressController.text !=
        _userProvider.user?.address) {
      updatedFields['address'] =
          settingsController.addressController.text.trim();
    }
    if (settingsController.stateController.text != _userProvider.user?.state) {
      updatedFields['state'] = settingsController.stateController.text.trim();
    }
    if (settingsController.cityController.text != _userProvider.user?.city) {
      updatedFields['city'] = settingsController.cityController.text.trim();
    }
    if (settingsController.zipController.text != _userProvider.user?.zipCode) {
      updatedFields['zip_code'] = settingsController.zipController.text.trim();
    }
    if (settingsController.userPhoto != null) {
      String? photoUrl =
          await _userProvider.uploadProfilePhoto(settingsController.userPhoto!);
      updatedFields['profile_photo'] = photoUrl;
    }

    return updatedFields;
  }

  Widget _getProfileImageWidget() {
    if (settingsController.userPhoto != null) {
      return CircleAvatar(
        radius: 60,
        backgroundImage: FileImage(settingsController.userPhoto!),
      );
    } else if (_userProvider.user?.profilePhoto != null &&
        _userProvider.user!.profilePhoto!.isNotEmpty) {
      return CircleAvatar(
        radius: 60,
        backgroundImage: NetworkImage(_userProvider.user!.profilePhoto!),
      );
    } else {
      return CircleAvatar(
        radius: 60,
        backgroundImage: AssetImage(Strings.profileAvatarPath),
      );
    }
  }
}
