import 'package:flutter/material.dart';
import 'package:teknosoft/features/up_coming/presentation/views/widgets/custom_app_bar.dart';

import '../../../../task/presentation/views/widgets/show_modal_button_sheet_add.dart';
import 'important_task_item_list_view.dart';

class ImportantViewBody extends StatelessWidget {
  const ImportantViewBody({
    super.key,
  });

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
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.0,
            right: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomAppBar(
                  title: "Important",
                  isImportant: true,
                ),
                SizedBox(
                  height: 20,
                ),
                ImportantTaskItemListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
