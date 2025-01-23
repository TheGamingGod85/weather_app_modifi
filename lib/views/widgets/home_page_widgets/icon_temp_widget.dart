import 'package:flutter/material.dart';

class IconTempWidget extends StatelessWidget {
  const IconTempWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // icon
        // Image.asset(
        //   'lib/assets/cloud.png',
        // ),

        // temp
        Text(
          '25°C',
          style: TextStyle(
            fontSize: 70,
            color: Colors.white,
            fontStyle: FontStyle.normal,
          ),
        ),
      ],
    );
  }
}
