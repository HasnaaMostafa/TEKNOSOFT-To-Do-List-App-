import 'package:flutter/material.dart';
import 'package:teknosoft/features/up_coming/presentation/views/widgets/custom_app_bar.dart';

import '../../../../task/presentation/views/widgets/show_modal_button_sheet_add.dart';
import 'calender.dart';
import 'task_item_list_view.dart';

class UpComingViewBody extends StatefulWidget {
  const UpComingViewBody({super.key});

  @override
  State<UpComingViewBody> createState() => _UpComingViewBodyState();
}

class _UpComingViewBodyState extends State<UpComingViewBody> {
  DateTime? selectedDate;

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
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomAppBar(
                  title: "Upcoming",
                ),
                Calender(
                  onDateChange: (selectedDate) {
                    setState(() {
                      this.selectedDate = selectedDate;
                    });
                  },
                ),
                TaskItemListView(selectedDate: selectedDate ?? DateTime.now()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
