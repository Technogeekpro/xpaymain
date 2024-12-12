import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/primary_appbar.dart';

class MoneyOutScanQrCodeScreen extends StatefulWidget {
  const MoneyOutScanQrCodeScreen({Key? key}) : super(key: key);

  @override
  MoneyOutScanQrCodeScreenState createState() =>
      MoneyOutScanQrCodeScreenState();
}

class MoneyOutScanQrCodeScreenState extends State<MoneyOutScanQrCodeScreen> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  Barcode? barcode;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void readQr() async {
    if (barcode != null) {
      controller!.pauseCamera();
      controller!.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        appbarColor: CustomColor.primaryColor,
        backgroundColor: CustomColor.primaryColor,
        autoLeading: false,
        elevation: 1,
        appBar: AppBar(),
        title: Text(
          Strings.scanQrTitle.tr,
          style: CustomStyle.commonTextTitleWhite,
        ),
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
        appbarSize: Dimensions.defaultAppBarHeight,
        toolbarHeight: Dimensions.defaultAppBarHeight,
      ),
      backgroundColor: CustomColor.screenBGColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: _bodyWidget(context),
      ),
    );
  }

  // body widget containing all widget elements
  _bodyWidget(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Positioned(
            child: _scanQrCodeWidget(context),
          ),
          Positioned(
            bottom: 50,
            right: 20,
            left: 20,
            child: _qrCodeBottomMessageWidget(context),
          )
        ],
      ),
    );
  }

  // QR code scan with qr code image
  _scanQrCodeWidget(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: _buildQrViewWidget(context),
    );
  }

  // bottom qr code message
  _qrCodeBottomMessageWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        controller?.resumeCamera();
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultPaddingSize,
        ),
        height: 70,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius),
        ),
        child: Row(
          children: [
            Image.asset(Strings.qrCodeIconImagePath),
            SizedBox(
              width: Dimensions.widthSize,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  Strings.qrCodeMessage.tr,
                  style: TextStyle(
                    color: CustomColor.primaryColor,
                    fontSize: Dimensions.smallTextSize * 0.9,
                    fontWeight: FontWeight.w500,
                  ),
                  softWrap: true,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildQrViewWidget(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
          cutOutSize: MediaQuery.of(context).size.width * 0.6,
          borderWidth: 8,
          borderLength: 20,
          borderRadius: 10,
          borderColor: CustomColor.primaryColor),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    // this.controller = controller;
    controller.scannedDataStream.listen((barcode) => setState(() {
          this.barcode = barcode;
          // print(this.barcode!.code);
          readQr();
        }));
  }
}
