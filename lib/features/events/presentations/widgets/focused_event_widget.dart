import 'package:cached_network_image/cached_network_image.dart';
import 'package:explorer/core/style/colors.dart';
import 'package:explorer/core/style/dimensions.dart';
import 'package:explorer/core/style/fonts.dart';
import 'package:explorer/features/events/entities/event.dart';
import 'package:explorer/features/events/presentations/event_details.dart';
import 'package:explorer/features/events/presentations/events_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

focusedEventWidget({
  double width = 230,
  double height = 260,
  required EventModel eventModel,
  required EventsPageSections section,
}) {
  final heroTag = eventModel.id + section.name;
  return InkWell(
    onTap: () => Get.to(
      () => EventDetailsView(
        eventModel: eventModel,
        heroTag: heroTag,
      ),
    ),
    focusColor: Colors.transparent,
    hoverColor: Colors.transparent,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    borderRadius: BorderRadius.circular(Dimensions.mediumRadius),
    child: Stack(
      children: [
        _imageBox(width, height, eventModel.image, heroTag),
        _dateBox(),
        _nameLocationBox(width, eventModel),
      ],
    ),
  );
}

Positioned _nameLocationBox(double width, EventModel eventModel) {
  return Positioned(
    bottom: 10,
    child: Container(
      width: width - 20,
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.mediumRadius),
        boxShadow: [
          BoxShadow(
            blurRadius: 16,
            color: Colors.grey.withOpacity(.07),
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(Dimensions.smallPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            eventModel.name ?? '--',
            style: AppFontsManager.semiBoldTextStyle(
              fontSize: Dimensions.defaultFontSize,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 12,
                color: Colors.black.withOpacity(.6),
              ),
              const SizedBox(width: 3),
              Expanded(
                child: Text(
                  eventModel.location ?? '--',
                  style: AppFontsManager.thinTextStyle(
                    fontSize: Dimensions.smallFontSize,
                    color: Colors.black.withOpacity(.6),
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
    top: Dimensions.smallPadding,
    right: Dimensions.smallPadding,
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
        height: height - 40,
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
