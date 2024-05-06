import 'package:flutter/material.dart';

import '../add_task_view.dart';

void showAddTaskBottomSheet(BuildContext context) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      context: context,
      builder: (BuildContext context) {
        return const AddTaskView();
      });
}
