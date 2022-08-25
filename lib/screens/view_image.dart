import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../brand_colors.dart';

class ViewImage extends StatelessWidget {
  final Uint8List image;
  const ViewImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.all(0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: BrandColors.primaryLight,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Secret Message',
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Brand-Bold',
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 25,
                ),
                Image.memory(image),
              ],
            ),
          )),
        ));
  }
}
