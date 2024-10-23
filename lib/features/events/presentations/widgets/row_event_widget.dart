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

rowEventWidget({
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
    borderRadius: BorderRadius.circular(Dimensions.mediumRadius),
    child: Container(
      width: Get.width,
      padding: const EdgeInsets.all(Dimensions.defPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.mediumRadius),
      ),
      child: Row(
        children: [
          _imageBox(eventModel.image, heroTag),
          const SizedBox(width: Dimensions.defPadding),
          _detailsColumn(eventModel),
        ],
      ),
    ),
  );
}

Expanded _detailsColumn(EventModel eventModel) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          eventModel.name ?? '--',
          style: AppFontsManager.semiBoldTextStyle(
            color: AppColorsManager.primaryColor,
            fontSize: Dimensions.defaultFontSize,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 5),
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
        if (eventModel.date != null) const SizedBox(height: 5),
        if (eventModel.date != null)
          Row(
            children: [
              const Icon(
                Icons.calendar_month_outlined,
                size: 12,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  DateFormat.yMMMMEEEEd().format(eventModel.date!),
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
  );
}

_imageBox(String? img, String heroTag) {
  return Hero(
    tag: heroTag,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(Dimensions.mediumRadius),
      child: CachedNetworkImage(
        imageUrl: img ?? '',
        errorWidget: (_, __, ___) => const Icon(
          Icons.image,
          color: Colors.grey,
        ),
        placeholder: (_, __) => const Icon(
          Icons.image,
          color: Colors.grey,
        ),
        width: 70,
        height: 70,
        fit: BoxFit.cover,
      ),
    ),
  );
}
