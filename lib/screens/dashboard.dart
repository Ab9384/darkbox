import 'package:darkbox/brand_colors.dart';
import 'package:darkbox/screens/decrypt.dart';
import 'package:darkbox/screens/encrypt.dart';
import 'package:darkbox/widgets/TaxiButton.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColors.primaryDark,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const Text(
              //   'Dashboard',
              //   style: TextStyle(
              //     color: BrandColors.secondary,
              //     fontSize: 30,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff2c3958),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Stack(
                    children: [
                      Image.asset(
                        'images/hacker.png',
                        color: BrandColors.primaryDark,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Welcome to',
                              style: TextStyle(
                                color: BrandColors.secondary,
                                fontSize: 40,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              )),
                          const Text('DarkBox',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(height: 30),
                          Text(
                              'Protecting privacy is key to ensuring human dignity, safety and self-determination\n\nOnce you\'ve lost your privacy, you realize you\'ve lost an extremely valuable thing.\n\nIf you agree with us use Darkbox to share your image secretly',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 13,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Image.asset(
                'images/hacker.png',
                height: 250,
                color: BrandColors.secondary,
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EncryptScreen(),
                          ),
                        );
                      },
                      child: const TaxiButton(
                        title: 'Encrypt',
                        color: BrandColors.primaryLight,
                        widget: 'images/encrypt.png',
                        textColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Decrypt(),
                          ),
                        );
                      },
                      child: const TaxiButton(
                        title: 'Decrypt',
                        color: BrandColors.primaryLight,
                        widget: 'images/decrypt.png',
                        textColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      )),
    );
  }
}
