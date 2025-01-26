import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateDayWidget extends StatelessWidget {
  const DateDayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    var formatter = DateFormat('MMM d');
    String formattedDate = formatter.format(now);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // date
            Text(
              formattedDate,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            // year
            Text(
              ',  ${now.year}',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
        Divider(
          color: Colors.blueGrey,
          thickness: 1,
          indent: 10,
          endIndent: 10,
        ),
      ],
    );
  }
}
