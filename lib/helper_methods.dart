import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:open_file/open_file.dart';

import 'brand_colors.dart';

class HelperMethods {
  static Widget loadingScreenIndicator() {
    return const SizedBox(
      width: 50,
      child: LoadingIndicator(
          indicatorType: Indicator.lineScale,
          colors: [
            BrandColors.colorPrimary,
            Colors.greenAccent,
            Color(0xffbbdefb),
            Colors.greenAccent,
            BrandColors.colorPrimary
          ],
          strokeWidth: 2,
          backgroundColor: Colors.transparent,
          pathBackgroundColor: Colors.black),
    );
  }

  /// Helper function to convert string to bytes

  // Helper function to expand byte messages to bit messages

  /// Helper function to encode one bit of message into 8 pixels

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}
