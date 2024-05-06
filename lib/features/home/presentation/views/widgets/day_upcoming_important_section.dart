import 'package:flutter/material.dart';
import 'package:teknosoft/features/home/presentation/views/widgets/up_coming_container.dart';

import 'important_container.dart';
import 'my_day_container.dart';

class DayUpcomingImportantSection extends StatelessWidget {
  const DayUpcomingImportantSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Container(
        height: 260,
        width: double.infinity,
        decoration: ShapeDecoration(
          color: const Color(0xfff7f8fd),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: const Column(
          children: [
            MyDayContainer(),
            Divider(
              color: Color(0xffe3eefd),
            ),
            UpComingContainer(),
            Divider(
              color: Color(0xffe3eefd),
            ),
            ImportantContainer(),
          ],
        ),
      ),
    );
  }
}
