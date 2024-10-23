import 'package:explorer/core/style/colors.dart';
import 'package:explorer/core/style/dimensions.dart';
import 'package:explorer/core/style/fonts.dart';
import 'package:flutter/material.dart';

class TitleWithViewAll extends StatelessWidget {
  final String title;
  final String? viewAllTitle;
  final double? horizontalMargin;
  final Function()? onViewAllTapped;

  const TitleWithViewAll({
    super.key,
    required this.title,
    this.viewAllTitle,
    this.horizontalMargin,
    this.onViewAllTapped,
  });

  @override
  Widget build(BuildContext context) {
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
}
