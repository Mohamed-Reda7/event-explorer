import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  late String _id;
  String? _image;
  String? _name;
  String? _location;
  String? _details;
  DateTime? _date;

  EventModel({
    required String id,
    String? image,
    String? name,
    String? location,
    String? details,
    DateTime? date,
  }) {
    _id = id;
    _image = image;
    _name = name;
    _location = location;
    _details = details;
    _date = date;
  }

  String get id => _id;
  String? get image => _image;
  String? get name => _name;
  String? get location => _location;
  String? get details => _details;
  DateTime? get date => _date;

  EventModel.fromJson(DocumentSnapshot document) {
    final data = document.data() as dynamic;

    _id = document.id;
    _image = data['image'];
    _name = data?['name'];
    _location = data['location'];
    _details = data['details'];
    _date = data['date']?.toDate();
  }
}
