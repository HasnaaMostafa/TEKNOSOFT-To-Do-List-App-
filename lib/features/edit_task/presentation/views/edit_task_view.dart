import 'package:flutter/material.dart';
import 'package:teknosoft/features/edit_task/presentation/views/widgets/edit_task_view_body.dart';

import '../../../task/data/models/task_model.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({
    super.key,
    required this.taskModel,
  });

  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return EditTaskViewBody(taskModel: taskModel);
  }
}
