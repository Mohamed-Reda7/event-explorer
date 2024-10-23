import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final double size;
  final String imgPath;

  const CustomCircleAvatar({
    super.key,
    this.size = 40,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size * .5),
      child: CachedNetworkImage(imageUrl: imgPath, width: size, height: size),
    );
  }
}
