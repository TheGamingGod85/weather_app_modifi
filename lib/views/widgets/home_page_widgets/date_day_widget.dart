import 'package:flutter/material.dart';

class DateDayWidget extends StatelessWidget {
  const DateDayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var currentDate = DateTime.now();
    var day = currentDate.day;
    return Center(
      child: Row(
        children: [
          // date
          Text(
            '$day',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          // day
        ],
      ),
    );
  }
}
