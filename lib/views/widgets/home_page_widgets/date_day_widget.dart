import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateDayWidget extends StatelessWidget {
  const DateDayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    var formatter = DateFormat('MMM d');
    String formattedDate = formatter.format(now);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // date
        Text(
          formattedDate,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        // year
        Text(
          ',  ${now.year}',
          style: TextStyle(),
        ),
      ],
    );
  }
}
