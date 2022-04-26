import 'package:flutter/material.dart';

import '../helper_methods.dart';

class ProgressDailog extends StatelessWidget {
  final String? status;

  const ProgressDailog({Key? key, this.status}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      backgroundColor: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.all(16.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                HelperMethods.loadingScreenIndicator(),
                const SizedBox(
                  width: 25.0,
                ),
                Text(
                  status!,
                  style: const TextStyle(fontSize: 15),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
