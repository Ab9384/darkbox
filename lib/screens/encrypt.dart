import 'dart:io';
import 'dart:typed_data';

import 'package:darkbox/brand_colors.dart';
import 'package:darkbox/helper_methods.dart';
import 'package:darkbox/globalVariable.dart';
import 'package:darkbox/screens/view_image.dart';
import 'package:darkbox/widgets/TaxiButton.dart';
import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as crypto;
import 'package:path_provider/path_provider.dart';
import '../widgets/chooseImageDialog.dart';

class EncryptScreen extends StatelessWidget {
  const EncryptScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColors.primaryDark,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
              Column(
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
                    'Encrypt your data',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
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
              const SizedBox(
                height: 40,
              ),
              // text box
              const Text(
                'Message',
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
                maxLines: 7,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter your data',
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
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter your secret key',
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
                height: 50,
              ),
              GestureDetector(
                onTap: () async {
                  String msg =
                      encrypt('message', 'my 32 length key................');
                  Uint16List img =
                      imageFile!.readAsBytesSync().buffer.asUint16List();
                  Uint16List encodedImg = img;
                  Uint16List expandedMsg = expandMsg(msg2bytes(msg));
                  Uint16List paddedMsg =
                      padMsg(getEncoderCapacity(img), expandedMsg);
                  for (int i = 0; i < getEncoderCapacity(img); ++i) {
                    encodedImg[i] = encodeOnePixel(img[i], paddedMsg[i]);
                  }
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

  encrypt(var msg, String secretKey) {
    crypto.Key key = crypto.Key.fromUtf8(secretKey);
    crypto.IV iv = crypto.IV.fromLength(16);
    crypto.Encrypter encrypter = crypto.Encrypter(crypto.AES(key));
    crypto.Encrypted encrypted = encrypter.encrypt(msg, iv: iv);
    msg = encrypted.base64;
    return msg;
  }

  String padCryptionKey(String key) {
    if (key.length > 32) {
      throw FlutterError('cryption_key_length_greater_than_32');
    }
    String paddedKey = key;
    int padCnt = 32 - key.length;
    for (int i = 0; i < padCnt; ++i) {
      paddedKey += '.';
    }
    return paddedKey;
  }

  Uint16List padToBytes(Uint16List msg) {
    int padSize = dataLength - msg.length % dataLength;
    Uint16List padded = Uint16List(msg.length + padSize);
    for (int i = 0; i < msg.length; ++i) {
      padded[i] = msg[i];
    }
    for (int i = 0; i < padSize; ++i) {
      padded[msg.length + i] = 0;
    }
    return padded;
  }

  int getEncoderCapacity(Uint16List img) {
    return img.length;
  }

  Uint16List msg2bytes(String msg) {
    return Uint16List.fromList(msg.codeUnits);
  }

  int getMsgSize(String msg) {
    Uint16List byteMsg = msg2bytes(msg);
    return byteMsg.length * dataLength;
  }

  int encodeOnePixel(int pixel, int msg) {
    if (msg != 1 && msg != 0) {
      throw FlutterError('msg_encode_bit_more_than_1_bit');
    }
    int lastBitMask = 254;
    int encoded = (pixel & lastBitMask) | msg;
    return encoded;
  }

  Uint16List padMsg(int capacity, Uint16List msg) {
    Uint16List padded = Uint16List(capacity);
    for (int i = 0; i < msg.length; ++i) {
      padded[i] = msg[i];
    }
    return padded;
  }

  Uint16List expandMsg(Uint16List msg) {
    Uint16List expanded = Uint16List(msg.length * dataLength);
    for (int i = 0; i < msg.length; ++i) {
      int msgByte = msg[i];
      for (int j = 0; j < dataLength; ++j) {
        int lastBit = msgByte & 1;
        expanded[i * dataLength + (dataLength - j - 1)] = lastBit;
        msgByte = msgByte >> 1;
      }
    }
    return expanded;
  }
}
