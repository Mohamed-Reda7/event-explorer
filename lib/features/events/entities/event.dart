import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  late String id;
  String? image;
  String? name;
  String? location;
  String? details;
  DateTime? date;

  EventModel.fromJson(DocumentSnapshot document) {
    final data = document.data() as dynamic;

    id = document.id;
    image = data['image'];
    name = data?['name'];
    location = data['location'];
    details = data['details'];
    date = data['date']?.toDate();
  }
}
