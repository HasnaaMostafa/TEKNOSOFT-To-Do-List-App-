import 'package:flutter/material.dart';
import 'package:teknosoft/features/my_day/presentation/views/widgets/completed_task_item_list_view.dart';
import 'package:teknosoft/features/up_coming/presentation/views/widgets/custom_app_bar.dart';

import '../../../../task/presentation/views/widgets/show_modal_button_sheet_add.dart';
import 'day_task_item_list_view.dart';

class DayViewBody extends StatefulWidget {
  const DayViewBody({
    super.key,
  });

  @override
  State<DayViewBody> createState() => _DayViewBodyState();
}

class _DayViewBodyState extends State<DayViewBody> {
  bool _isDayTasksVisible = true;
  bool _isCompletedTasksVisible = false;

  void _toggleDayVisibility() {
    setState(() {
      _isDayTasksVisible = true;
      _isCompletedTasksVisible = false;
    });
  }

  void _toggleCompletedVisibility() {
    setState(() {
      _isDayTasksVisible = false;
      _isCompletedTasksVisible = true;
    });
  }

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomAppBar(title: ""),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: _toggleDayVisibility,
                          child: Text("Daily Tasks",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: _isDayTasksVisible
                                    ? const Color(0xff6783d2)
                                    : Colors.grey,
                              )),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: _toggleCompletedVisibility,
                          child: Text("Completed Tasks",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: _isCompletedTasksVisible
                                    ? const Color(0xff6783d2)
                                    : Colors.grey,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Visibility(
                    visible: _isDayTasksVisible,
                    child: const DayTaskItemListView()),
                Visibility(
                    visible: _isCompletedTasksVisible,
                    child: const CompletedTaskItemListView())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
