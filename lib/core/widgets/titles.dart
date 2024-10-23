import 'package:explorer/core/style/colors.dart';
import 'package:explorer/core/style/dimensions.dart';
import 'package:explorer/core/style/fonts.dart';
import 'package:flutter/material.dart';

titleWithViewAll({
  required String title,
  String? viewAllTitle,
  double? horizontalMargin,
  Function()? onViewAllTapped,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: horizontalMargin ?? Dimensions.edgePadding,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppFontsManager.semiBoldTextStyle(
            fontSize: Dimensions.h2FontSize,
          ),
        ),
        InkWell(
          onTap: onViewAllTapped,
          child: Text(
            viewAllTitle ?? 'View All',
            style: AppFontsManager.thinTextStyle(
              fontSize: Dimensions.defaultFontSize,
            ).copyWith(
              decoration: TextDecoration.underline,
              color: AppColorsManager.primaryColor,
              decorationColor: AppColorsManager.primaryColor,
            ),
          ),
        ),
      ],
    ),
  );
}
