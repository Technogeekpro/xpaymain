import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xpay/widgets/snackbar/custom_snackbar.dart';

import '../../controller/input_image_controller.dart';
import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';

class ImagePickerWidget extends StatelessWidget {
  ImagePickerWidget({Key? key}) : super(key: key);

  final controller = Get.put(InputImageController());
  File? imageFile;

  Future pickImage(imageSource) async {
    try {
      final image =
          await ImagePicker().pickImage(source: imageSource, imageQuality: 100);
      if (image == null) return;

      imageFile = File(image.path);
      controller.setImagePath(imageFile!.path);
    } on PlatformException catch (e) {
      CustomSnackBar.error('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Center(
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
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: controller.isImagePathSet.value == true
                          ? FileImage(
                              File(
                                controller.imagePath.value,
                              ),
                            )
                          : const AssetImage(Strings.profileAvatarPath)
                              as ImageProvider,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) =>
                            _imagePickerBottomSheetWidget(context),
                      );
                    },
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
      );
    });
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
}
