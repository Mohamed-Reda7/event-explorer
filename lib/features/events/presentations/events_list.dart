import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explorer/core/style/dimensions.dart';
import 'package:explorer/core/widgets/app_bar.dart';
import 'package:explorer/core/widgets/avatar_image.dart';
import 'package:explorer/core/widgets/titles.dart';
import 'package:explorer/features/events/entities/event.dart';
import 'package:explorer/features/events/presentations/view_all.dart';
import 'package:explorer/features/events/presentations/widgets/focused_event_widget.dart';
import 'package:explorer/features/events/presentations/widgets/row_event_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum EventsPageSections { nearest, all }

class EventsListView extends StatelessWidget {
  const EventsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  ListView _body() {
    return ListView(
      padding: const EdgeInsets.only(
        top: Dimensions.edgePadding,
      ),
      children: [
        TitleWithViewAll(
          title: 'Nearest events',
          onViewAllTapped: () => Get.to(
            () => const ViewAllEvents(section: EventsPageSections.nearest),
          ),
        ),
        const SizedBox(height: Dimensions.defPadding),
        _onTheTopOfTheList(),
        const SizedBox(height: 8),
        TitleWithViewAll(
          title: 'Events',
          onViewAllTapped: () => Get.to(
            () => const ViewAllEvents(
              section: EventsPageSections.all,
            ),
          ),
        ),
        const SizedBox(height: Dimensions.defPadding),
        _ourEvents()
      ],
    );
  }

  _ourEvents() {
    return StreamBuilder<QuerySnapshot>(
      stream:
          FirebaseFirestore.instance.collection('events').limit(20).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return SizedBox(
            height: 200,
            width: Get.width,
            child: const CupertinoActivityIndicator(),
          );
        }

        return ListView.separated(
          itemCount: snapshot.data!.docs.length,
          shrinkWrap: true,
          padding:
              const EdgeInsets.symmetric(horizontal: Dimensions.edgePadding),
          separatorBuilder: (_, __) =>
              const SizedBox(height: Dimensions.smallPadding),
          itemBuilder: (context, idx) => rowEventWidget(
            eventModel: EventModel.fromJson(snapshot.data!.docs[idx]),
            section: EventsPageSections.all,
          ),
          physics: const BouncingScrollPhysics(),
        );
      },
    );
  }

  _onTheTopOfTheList() {
    return SizedBox(
      width: Get.width,
      height: 260,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('events')
            .orderBy('date')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }

          return ListView.separated(
            itemCount: snapshot.data!.docs.length,
            padding:
                const EdgeInsets.symmetric(horizontal: Dimensions.edgePadding),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) =>
                const SizedBox(width: Dimensions.smallPadding),
            itemBuilder: (context, idx) => focusedEventWidget(
              eventModel: EventModel.fromJson(snapshot.data!.docs[idx]),
              section: EventsPageSections.nearest,
            ),
          );
        },
      ),
    );
  }

  AppBar _appBar() {
    return customAppBar(
      title: 'Event Explorer',
      actions: [
        const CustomCircleAvatar(
          imgPath:
              'https://img.freepik.com/premium-photo/3d-style-avatar-profile-picture-featuring-male-character-generative-ai_739548-13626.jpg',
        ),
        const SizedBox(width: Dimensions.edgePadding),
      ],
    );
  }
}
