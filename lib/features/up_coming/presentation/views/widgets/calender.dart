import 'dart:core';

import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class Calender extends StatelessWidget {
  const Calender({super.key, this.onDateChange});

  final void Function(DateTime)? onDateChange;

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    DateTime nextDay = currentDate.add(const Duration(days: 1));

    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EasyDateTimeLine(
            initialDate: DateTime.now(),
            locale: "en_US",
            onDateChange: onDateChange,
            headerProps: const EasyHeaderProps(
              dateFormatter: DateFormatter.custom("MMM yyyy"),
            ),
            dayProps: const EasyDayProps(
              height: 80,
              width: 50,
              dayStructure: DayStructure.dayStrDayNum,
              activeDayStyle: DayStyle(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff6397a6),
                      Color(0xff5270b7),
                    ],
                  ),
                ),
              ),
              todayStyle:
                  DayStyle(borderRadius: 18, decoration: BoxDecoration()),
              inactiveDayStyle: DayStyle(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 32.0,
          ),
        ],
      ),
    );
  }

  String _getAbbreviation(DateTime day) {
    // Function to return the abbreviation of the day name
    switch (day.weekday) {
      case DateTime.monday:
        return 'Mon';
      case DateTime.tuesday:
        return 'Tue';
      case DateTime.wednesday:
        return 'Wed';
      case DateTime.thursday:
        return 'Thu';
      case DateTime.friday:
        return 'Fri';
      case DateTime.saturday:
        return 'Sat';
      case DateTime.sunday:
        return 'Sun';
      default:
        return '';
    }
  }
}
