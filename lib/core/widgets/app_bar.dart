import 'package:flutter/material.dart';

AppBar customAppBar({required String title, List<Widget>? actions}) {
  return AppBar(
    title: Text(title),
    actions: actions,
  );
}
