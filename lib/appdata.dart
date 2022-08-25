import 'dart:io';

import 'package:flutter/cupertino.dart';

class AppData extends ChangeNotifier {
  File? imageFile;
  File? textFile;
  updateImageFile(File file) {
    imageFile = file;
    notifyListeners();
  }

  updateTextFile(File file) {
    textFile = file;
    notifyListeners();
  }

  updateFileNull() {
    imageFile = null;
    notifyListeners();
  }
}
