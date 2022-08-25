import 'dart:io';
import 'package:darkbox/appdata.dart';
import 'package:darkbox/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ChooseImageDialog extends StatelessWidget {
  const ChooseImageDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final picker = ImagePicker();
    pickImage(ImageSource imageSource) async {
      final pickedFile = await picker.pickImage(
        source: imageSource,
        imageQuality: 40,
      );
      Provider.of<AppData>(context, listen: false)
          .updateImageFile(File(pickedFile!.path));
      Navigator.pop(context);
    }

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
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Choose Image',
                    style: TextStyle(
                        fontSize: 22,
                        color: BrandColors.secondary,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 35),
                  GestureDetector(
                    onTap: () {
                      pickImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'images/camera.png',
                          height: 30,
                        ),
                        const SizedBox(width: 20),
                        const Expanded(
                            child: Text(
                          'Camera',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => pickImage(ImageSource.gallery),
                    child: Row(
                      children: [
                        Image.asset(
                          'images/gallery.png',
                          height: 30,
                        ),
                        const SizedBox(width: 20),
                        const Expanded(
                            child: Text(
                          'Gallery',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
