import 'package:explorer/core/style/colors.dart';
import 'package:explorer/core/style/dimensions.dart';
import 'package:explorer/core/style/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonWidget extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String bodyTxt;
  final Color? bgColor;
  final Color? txtColor;
  final double? height;
  final double? txtSize;

  const CustomButtonWidget({
    super.key,
    this.onTap,
    required this.bodyTxt,
    this.bgColor,
    this.txtColor,
    this.height,
    this.txtSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(Dimensions.mediumRadius),
      child: Container(
        width: Get.width,
        height: height ?? 60,
        decoration: BoxDecoration(
          color: bgColor ?? AppColorsManager.primaryColor,
          borderRadius: BorderRadius.circular(Dimensions.mediumRadius),
        ),
        alignment: Alignment.center,
        child: Text(
          bodyTxt,
          style: AppFontsManager.regularTextStyle(
            color: txtColor ?? Colors.white,
            fontSize: txtSize ?? Dimensions.h1FontSize,
          ),
        ),
      ),
    );
  }
}
