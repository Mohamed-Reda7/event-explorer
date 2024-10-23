import 'package:explorer/core/style/dimensions.dart';
import 'package:explorer/core/style/fonts.dart';
import 'package:explorer/core/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showJoiningConfirmationDialog() {
  showDialog(
    context: Get.context!,
    builder: (context) {
      return _dialog();
    },
  );
}

Dialog _dialog() {
  return Dialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    child: Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.mediumRadius),
      ),
      constraints: const BoxConstraints(maxWidth: 400),
      padding: const EdgeInsets.all(Dimensions.defPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Are you sure you want to join this event? By confirming this action you will send your full name, email and photo to the event organizers.',
            style: AppFontsManager.regularTextStyle(
                fontSize: Dimensions.defaultFontSize),
          ),
          const SizedBox(height: Dimensions.defPadding),
          Row(
            children: [
              TextButton(
                onPressed: () => Get.back(),
                child: const Text('Cancel'),
              ),
              const Expanded(
                child: CustomButtonWidget(
                  bodyTxt: 'Confirm',
                  height: 50,
                  txtSize: Dimensions.h2FontSize,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
