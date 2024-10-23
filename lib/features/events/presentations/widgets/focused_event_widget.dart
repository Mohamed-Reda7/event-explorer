import 'package:cached_network_image/cached_network_image.dart';
import 'package:explorer/core/style/colors.dart';
import 'package:explorer/core/style/dimensions.dart';
import 'package:explorer/core/style/fonts.dart';
import 'package:explorer/features/events/entities/event.dart';
import 'package:explorer/features/events/presentations/event_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

focusedEventWidget({
  double width = 230,
  double height = 260,
  required EventModel eventModel,
  required String section,
}) {
  final heroTag = eventModel.id + section;
  return InkWell(
    onTap: () => Get.to(
      () => EventDetailsView(
        eventModel: eventModel,
        heroTag: heroTag,
      ),
    ),
    borderRadius: BorderRadius.circular(Dimensions.mediumRadius),
    child: Stack(
      children: [
        _imageBox(
          width,
          height,
          eventModel.image,
          heroTag,
        ),
        _dateBox(),
        _nameLocationBox(width, eventModel),
      ],
    ),
  );
}

Positioned _nameLocationBox(double width, EventModel eventModel) {
  return Positioned(
    bottom: 0,
    child: Container(
      width: width - 20,
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.mediumRadius),
      ),
      padding: const EdgeInsets.all(Dimensions.smallPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            eventModel.name ?? '--',
            style: AppFontsManager.semiBoldTextStyle(
              fontSize: Dimensions.defaultFontSize,
              color: AppColorsManager.primaryColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 12,
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
        ],
      ),
    ),
  );
}

Positioned _dateBox() {
  return Positioned(
    top: Dimensions.edgePadding,
    right: Dimensions.edgePadding,
    child: Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.smallRadius),
      ),
      child: Column(
        children: [
          Text(
            '${DateFormat.MMM().format(DateTime.now())}.',
            style: AppFontsManager.thinTextStyle(
              fontSize: Dimensions.smallFontSize,
            ),
          ),
          Text(
            DateFormat.d().format(DateTime.now()),
            style: AppFontsManager.semiBoldTextStyle(
              fontSize: Dimensions.smallFontSize,
              color: AppColorsManager.primaryColor,
            ),
          ),
        ],
      ),
    ),
  );
}

_imageBox(double width, double height, String? img, String heroTag) {
  return Hero(
    tag: heroTag,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(Dimensions.mediumRadius),
      child: CachedNetworkImage(
        imageUrl: img ?? '',
        width: width,
        height: height - 30,
        fit: BoxFit.cover,
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
