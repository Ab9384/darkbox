import 'dart:typed_data';

import 'package:darkbox/brand_colors.dart';
import 'package:darkbox/widgets/ProgressDailog.dart';
import 'package:darkbox/widgets/TaxiButton.dart';
import 'package:darkbox/widgets/alertingDialog.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as crypto;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../appdata.dart';
import '../widgets/chooseImageDialog.dart';

class EncryptScreen extends StatelessWidget {
  const EncryptScreen({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    TextEditingController nameController = TextEditingController();
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
                    'Encrypt',
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
                      'images/encrypt.png',
                      height: 200,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Secure your image',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    (Provider.of<AppData>(context, listen: true).imageFile !=
                            null)
                        ? Text(
                            Provider.of<AppData>(context, listen: true)
                                .imageFile!
                                .path,
                            style: const TextStyle(color: Colors.white),
                          )
                        : GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const ChooseImageDialog();
                                  });
                            },
                            child: const TaxiButton(
                              title: 'Choose Image',
                              iconData: Icons.image,
                              color: BrandColors.primaryLight,
                              textColor: Colors.white,
                            ),
                          )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'File Name',
                style: TextStyle(
                  color: BrandColors.secondary,
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                maxLines: 1,
                maxLength: 12,
                controller: nameController,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter your secret file name',
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
                height: 15,
              ),
              TextField(
                maxLines: 1,
                maxLength: 32,
                controller: controller,
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
                  if (Provider.of<AppData>(context, listen: false).imageFile ==
                      null) {
                    Fluttertoast.showToast(msg: 'Please Choose Image file');
                    return;
                  }
                  if (nameController.text.isEmpty) {
                    Fluttertoast.showToast(msg: 'Enter File Name');
                    return;
                  }
                  if (controller.text.length < 32) {
                    Fluttertoast.showToast(msg: 'Secret key not long enough!');
                    return;
                  }

                  Uint8List reposnse =
                      Provider.of<AppData>(context, listen: false)
                          .imageFile!
                          .readAsBytesSync();
                  // String strlength = 'my 32 length key................';
                  showDialog(
                      context: context,
                      builder: (context) =>
                          const ProgressDailog(status: 'Creating...'));
                  var concatenate = StringBuffer();
                  for (int i = 0; i < reposnse.length; i++) {
                    concatenate
                        .write(encrypt(reposnse[i], controller.text) + ',');
                  }

                  // print(concatenate);

                  //code for decrypting message

                  String finalMessage =
                      encrypt(concatenate.toString(), controller.text);
                  Navigator.pop(context);
                  print(finalMessage);
                  showDialog(
                      context: context,
                      builder: (context) => AlertingDialog(
                          title: 'Message',
                          body: finalMessage,
                          fileName: nameController.text,
                          textAlign: TextAlign.center));
                  Provider.of<AppData>(context, listen: false).updateFileNull();
                  // showDialog(
                  //     context: context,
                  //     builder: (context) => ViewImage(image: bytes));
                },
                child: const TaxiButton(
                  title: 'Encrypt',
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

  String encrypt(var msg, String secretKey) {
    crypto.Key key = crypto.Key.fromUtf8(secretKey);
    crypto.IV iv = crypto.IV.fromLength(16);
    crypto.Encrypter encrypter = crypto.Encrypter(crypto.AES(key));
    crypto.Encrypted encrypted = encrypter.encrypt(msg.toString(), iv: iv);
    msg = encrypted.base64;
    return msg;
  }

  String decrypt(var msg, String secretKey) {
    crypto.Key key = crypto.Key.fromUtf8(secretKey);
    crypto.IV iv = crypto.IV.fromLength(16);
    crypto.Encrypter encrypter = crypto.Encrypter(crypto.AES(key));
    crypto.Encrypted encrypted = Encrypted.from64(msg);
    String deMsg = encrypter.decrypt(encrypted, iv: iv);

    return deMsg;
  }
  //embed text in image and save it as a new image

}
