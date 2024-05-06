import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teknosoft/features/home/presentation/manager/task_cubit/task_cubit.dart';
import 'package:teknosoft/features/home/presentation/manager/task_cubit/task_state.dart';
import 'package:teknosoft/features/task/data/models/task_model.dart';
import 'package:teknosoft/features/up_coming/presentation/views/widgets/task_item.dart';

class TaskItemListView extends StatelessWidget {
  const TaskItemListView({super.key, required this.selectedDate});
  final DateTime selectedDate;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit, TaskState>(
      listener: (context, state) {},
      builder: (context, state) {
        List<TaskModel> tasks = BlocProvider.of<TaskCubit>(context).tasks ?? [];
        List<TaskModel> filteredTasks = tasks.where((task) {
          DateTime taskDate = DateTime.parse(task.date);
          return taskDate.year == selectedDate.year &&
              taskDate.month == selectedDate.month &&
              taskDate.day == selectedDate.day;
        }).toList();
        return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: filteredTasks.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return TaskItem(
                taskModel: filteredTasks[index],
              );
            });
      },
    );
  }
}
