// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../brand_colors.dart';
import 'TaxiButton.dart';

class AlertingDialog extends StatefulWidget {
  final title, body, fileName;
  final TextAlign? textAlign;

  const AlertingDialog({this.title, this.body, this.textAlign, this.fileName});

  @override
  _AlertingDialogState createState() => _AlertingDialogState();
}

class _AlertingDialogState extends State<AlertingDialog> {
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
          color: BrandColors.colorPrimary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Brand-Bold',
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.body.toString().substring(0, 300) + '.....',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                    textAlign: widget.textAlign ?? TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () async {
                    final directory = await getApplicationSupportDirectory();
                    final path = directory.path;
                    File file = File('$path/${widget.fileName}.txt');
                    file.writeAsString(widget.body.toString());
                    Share.shareFiles([file.path], text: 'Great picture');
                  },
                  child: const SizedBox(
                    width: 200,
                    child: TaxiButton(
                      title: 'Share Secret',
                      iconData: Icons.share,
                      color: BrandColors.secondary,
                      textColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
