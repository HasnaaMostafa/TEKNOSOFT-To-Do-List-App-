import 'package:flutter/material.dart';
import 'package:teknosoft/features/home/presentation/views/widgets/tasks_categories_section.dart';

import '../../../../task/presentation/views/widgets/show_modal_button_sheet_add.dart';
import 'day_upcoming_important_section.dart';
import 'home_header.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CircleAvatar(
          radius: 30,
          backgroundColor: const Color(0xff5f8dac),
          child: IconButton(
            onPressed: () {
              showAddTaskBottomSheet(context);
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          )),
      backgroundColor: const Color(0xffe9f0fe),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              HomeHeader(),
              DayUpcomingImportantSection(),
              TasksCategoriesSection()
            ],
          ),
        ),
      ),
    );
  }
}
