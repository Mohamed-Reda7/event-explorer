import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explorer/core/style/dimensions.dart';
import 'package:explorer/core/widgets/app_bar.dart';
import 'package:explorer/features/events/entities/event.dart';
import 'package:explorer/features/events/presentations/events_list.dart';
import 'package:explorer/features/events/presentations/widgets/row_event_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewAllEvents extends StatelessWidget {
  final EventsPageSections section;
  const ViewAllEvents({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Events'),
      body: _body(),
    );
  }

  StreamBuilder<QuerySnapshot<Object?>> _body() {
    final stream = section == EventsPageSections.all
        ? FirebaseFirestore.instance.collection('events').snapshots()
        : FirebaseFirestore.instance
            .collection('events')
            .orderBy('date')
            .snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return const Center(
            child: CupertinoActivityIndicator(),
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
            section: section,
          ),
          physics: const BouncingScrollPhysics(),
        );
      },
    );
  }
}
