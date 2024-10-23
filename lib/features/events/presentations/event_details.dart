import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:explorer/core/style/colors.dart';
import 'package:explorer/core/style/dimensions.dart';
import 'package:explorer/core/style/fonts.dart';
import 'package:explorer/core/widgets/app_bar.dart';
import 'package:explorer/features/events/entities/event.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EventDetailsView extends StatelessWidget {
  final EventModel eventModel;
  final String heroTag;

  const EventDetailsView({
    super.key,
    required this.eventModel,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Details'),
      body: _body(),
    );
  }

  _body() {
    return Stack(
      children: [
        _eventDetails(),
        _joinEventButton(),
      ],
    );
  }

  Positioned _eventDetails() {
    return Positioned.fill(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(Dimensions.edgePadding),
        child: Column(
          children: [
            _imageBox(),
            const SizedBox(height: Dimensions.defPadding),
            _details(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Positioned _joinEventButton() {
    return Positioned(
      bottom: 0,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            width: Get.width,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey.shade200.withOpacity(0.5),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(Dimensions.mediumRadius),
                topRight: Radius.circular(Dimensions.mediumRadius),
              ),
            ),
            padding: const EdgeInsets.all(Dimensions.edgePadding),
            child: Column(
              children: [
                Container(
                  width: Get.width,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColorsManager.primaryColor,
                    borderRadius:
                        BorderRadius.circular(Dimensions.mediumRadius),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Join Event',
                    style: AppFontsManager.regularTextStyle(
                      color: Colors.white,
                      fontSize: Dimensions.h1FontSize,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _details() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.smallPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            eventModel.name ?? '--',
            style: AppFontsManager.boldTextStyle(
              fontSize: Dimensions.h1FontSize,
            ),
          ),
          if (eventModel.date != null)
            const SizedBox(height: Dimensions.extraSmallPadding),
          if (eventModel.date != null)
            Row(
              children: [
                const Icon(
                  Icons.calendar_month_outlined,
                  size: 12,
                  color: AppColorsManager.primaryColor,
                ),
                const SizedBox(width: 3),
                Expanded(
                  child: Text(
                    '${DateFormat.yMMMMd().format(eventModel.date!)}  ${TimeOfDay.fromDateTime(eventModel.date!).format(Get.context!)}',
                    style: AppFontsManager.thinTextStyle(
                      fontSize: Dimensions.smallFontSize,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          const SizedBox(height: Dimensions.extraSmallPadding),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 12,
                color: AppColorsManager.primaryColor,
              ),
              const SizedBox(width: 3),
              Expanded(
                child: Text(
                  eventModel.location ?? '--',
                  style: AppFontsManager.thinTextStyle(
                    fontSize: Dimensions.smallFontSize,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: Dimensions.extraSmallPadding),
          Text(
            eventModel.details ?? '--',
            style: AppFontsManager.thinTextStyle(
              fontSize: Dimensions.smallFontSize,
            ),
          ),
        ],
      ),
    );
  }

  _imageBox() {
    return Hero(
      tag: heroTag,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimensions.mediumRadius),
        child: CachedNetworkImage(
          imageUrl: eventModel.image ?? '',
          width: Get.width,
          fit: BoxFit.fitWidth,
          errorWidget: (_, __, ___) => const Icon(
            Icons.image,
            color: Colors.grey,
          ),
          placeholder: (_, __) => const Icon(
            Icons.image,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
