import 'package:flutter/material.dart';
import 'package:teknosoft/features/task/data/models/task_model.dart';

import '../edit_task_view.dart';

void showEditTaskBottomSheet(BuildContext context, TaskModel taskModel) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      context: context,
      builder: (BuildContext context) {
        return EditTaskView(
          taskModel: taskModel,
        );
      });
}
