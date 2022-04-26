import 'package:flutter/material.dart';

import '../brand_colors.dart';

class TaxiOutlineButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final Color color;

  const TaxiOutlineButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            )),
            backgroundColor: MaterialStateProperty.all(Colors.grey[200])),
        onPressed: onPressed,
        child: SizedBox(
          height: 50.0,
          child: Center(
            child: Text(title,
                style: const TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Brand-Bold',
                    color: BrandColors.colorTextDark)),
          ),
        ));
  }
}
