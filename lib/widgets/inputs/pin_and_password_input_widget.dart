import 'package:flutter/material.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';

class PinAndPasswordInputWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final String? Function(String? validation)? validator;
  final bool? readOnly;
  final Color? color;
  final double focusedBorderWidth;
  final double enabledBorderWidth;
  final Color borderColor;

  const PinAndPasswordInputWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.validator,
    this.readOnly = false,
    this.focusedBorderWidth = 1,
    this.enabledBorderWidth = 2,
    this.color = Colors.white,
    this.borderColor = CustomColor.primaryColor,
  }) : super(key: key);

  @override
  PinAndPasswordInputWidgetState createState() =>
      PinAndPasswordInputWidgetState();
}

class PinAndPasswordInputWidgetState extends State<PinAndPasswordInputWidget> {
  bool isVisibility = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Dimensions.heightSize * 0.5,
        ),
        SizedBox(
          height: Dimensions.inputBoxHeight,
          width: double.infinity,
          child: TextFormField(
            readOnly: false,
            style: TextStyle(
              color: CustomColor.primaryTextColor,
              fontSize: Dimensions.smallTextSize,
              fontWeight: FontWeight.w400,
            ),
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            validator: widget.validator,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
                borderSide: BorderSide(
                    color: CustomColor.primaryColor.withOpacity(0.4),
                    width: widget.enabledBorderWidth),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: CustomColor.primaryColor,
                    width: widget.focusedBorderWidth),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
                borderSide: const BorderSide(color: Colors.red, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
                borderSide: const BorderSide(color: Colors.red, width: 1),
              ),
              filled: true,
              fillColor: widget.color,
              contentPadding: const EdgeInsets.only(
                  left: 0, right: 16, top: 14, bottom: 10),
              hintText: widget.hintText,
              hintStyle: CustomStyle.hintTextStyle,
              suffixIcon: IconButton(
                icon: Icon(
                  isVisibility ? Icons.visibility_off : Icons.visibility,
                ),
                color: CustomColor.primaryColor,
                onPressed: () {
                  setState(() {
                    isVisibility = !isVisibility;
                  });
                },
              ),
            ),
            obscureText: isVisibility,
          ),
        )
      ],
    );
  }
}
