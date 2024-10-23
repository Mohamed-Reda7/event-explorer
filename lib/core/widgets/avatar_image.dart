import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

customCircleAvatar({double size = 40, required String imgPath}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(size * .5),
    child: CachedNetworkImage(imageUrl: imgPath, width: size, height: size),
  );
}
