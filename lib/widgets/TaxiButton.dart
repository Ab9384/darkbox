import 'package:flutter/material.dart';

class TaxiButton extends StatelessWidget {
  final String title;
  final Color color;
  final Color? textColor;
  final String? widget;
  final IconData? iconData;
  final Gradient? gradient;
  const TaxiButton(
      {Key? key,
      required this.title,
      required this.color,
      this.gradient,
      this.iconData,
      this.textColor,
      this.widget})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
        borderRadius: BorderRadius.circular(25),
      ),
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              children: [
                Visibility(
                  visible: (iconData != null),
                  child: Icon(
                    iconData,
                    color: textColor,
                  ),
                ),
                Visibility(
                  visible: (iconData != null),
                  child: const SizedBox(
                    width: 15,
                  ),
                ),
                Visibility(
                  visible: (widget != null),
                  child: Image.asset(
                    widget.toString(),
                    height: 20,
                  ),
                ),
                Visibility(
                  visible: (widget != null),
                  child: const SizedBox(
                    width: 15,
                  ),
                ),
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: textColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
