import 'package:darkbox/brand_colors.dart';
import 'package:darkbox/widgets/TaxiButton.dart';
import 'package:flutter/material.dart';

import '../widgets/chooseImageDialog.dart';

class Decrypt extends StatefulWidget {
  const Decrypt({Key? key}) : super(key: key);

  @override
  State<Decrypt> createState() => _DecryptState();
}

class _DecryptState extends State<Decrypt> {
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
              Column(
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
                    'Decrypt your data',
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
              const TaxiButton(
                title: 'Decrypt',
                textColor: Colors.white,
                color: BrandColors.secondary,
                widget: 'images/decrypt.png',
              )
            ]),
          ),
        ),
      ),
    );
  }
}
