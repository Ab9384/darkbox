import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../brand_colors.dart';

class ViewImage extends StatelessWidget {
  final Uint8List image;
  const ViewImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColors.primaryDark,
      body: SafeArea(child: Image.memory(image)),
    );
  }
}
