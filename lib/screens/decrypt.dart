import 'dart:io';
import 'dart:typed_data';

import 'package:darkbox/brand_colors.dart';
import 'package:darkbox/screens/view_image.dart';
import 'package:darkbox/widgets/ProgressDailog.dart';
import 'package:darkbox/widgets/TaxiButton.dart';
import 'package:encrypt/encrypt.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as crypto;
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Decrypt extends StatefulWidget {
  const Decrypt({key}) : super(key: key);

  @override
  State<Decrypt> createState() => _DecryptState();
}

class _DecryptState extends State<Decrypt> {
  TextEditingController message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColors.primaryDark,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: BrandColors.primaryLight,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5.0,
                                spreadRadius: 0.5,
                                offset: Offset(0.7, 0.7))
                          ]),
                      child: const CircleAvatar(
                        backgroundColor: BrandColors.primaryLight,
                        radius: 20.0,
                        child: Icon(
                          Icons.arrow_back,
                          color: BrandColors.secondary,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Decrypt',
                    style: TextStyle(
                      fontSize: 25,
                      color: BrandColors.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 20.0,
                      child: Icon(
                        Icons.track_changes,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/decrypt.png',
                      height: 200,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Reveal secret data',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     showDialog(
                    //         context: context,
                    //         builder: (context) {
                    //           return const ChooseImageDialog();
                    //         });
                    //   },
                    //   child: const TaxiButton(
                    //     title: 'Choose Image',
                    //     iconData: Icons.image,
                    //     color: BrandColors.primaryLight,
                    //     textColor: Colors.white,
                    //   ),
                    // )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              // text box

              const SizedBox(
                height: 20,
              ),
              // secret key text box
              const Text(
                'Secret Key',
                style: TextStyle(
                  color: BrandColors.secondary,
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                maxLines: 1,
                maxLength: 32,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                controller: message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter your secret key',
                  counterStyle: const TextStyle(color: Colors.white),
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 15,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              GestureDetector(
                onTap: () async {
                  if (message.text.length < 32) {
                    Fluttertoast.showToast(msg: 'Secret key not long enough!');
                    return;
                  }
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['txt'],
                  );
                  if (result != null) {
                    showDialog(
                        context: context,
                        builder: (context) => const ProgressDailog(
                              status: 'Please Wait...',
                            ));
                    File file = File(result.files.single.path!);
                    String text = file.readAsStringSync();
                    List<String> encryptedMessage = [];
                    // String strlength = 'my 32 length key................';
                    String messageList = decrypt(text, message.text);
                    encryptedMessage = messageList.toString().split(',');
                    List<int> unit = [];
                    for (int i = 0; i < encryptedMessage.length - 1; i++) {
                      unit.add(int.parse(
                          decrypt(encryptedMessage[i], message.text)));
                    }
                    Uint8List bytes = Uint8List.fromList(unit);
                    Navigator.pop(context);
                    showDialog(
                        context: context,
                        builder: (context) => ViewImage(image: bytes));
                  } else {
                    // User canceled the picker
                  }
                },
                child: const TaxiButton(
                  title: 'Decrypt',
                  textColor: Colors.white,
                  color: BrandColors.secondary,
                  widget: 'images/decrypt.png',
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  String decrypt(var msg, String secretKey) {
    crypto.Key key = crypto.Key.fromUtf8(secretKey);
    crypto.IV iv = crypto.IV.fromLength(16);
    crypto.Encrypter encrypter = crypto.Encrypter(crypto.AES(key));
    crypto.Encrypted encrypted = Encrypted.from64(msg);
    String deMsg = encrypter.decrypt(encrypted, iv: iv);

    return deMsg;
  }

  // Future<int> readCounter() async {
  //   try {
  //     final file = await _localFile;

  //     // Read the file
  //     final contents = await file.readAsString();

  //     return int.parse(contents);
  //   } catch (e) {
  //     // If encountering an error, return 0
  //     return 0;
  //   }
  // }
}
