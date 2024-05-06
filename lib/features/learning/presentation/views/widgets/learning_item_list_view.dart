import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teknosoft/features/home/presentation/manager/task_cubit/task_cubit.dart';
import 'package:teknosoft/features/home/presentation/manager/task_cubit/task_state.dart';
import 'package:teknosoft/features/task/data/models/task_model.dart';
import 'package:teknosoft/features/up_coming/presentation/views/widgets/task_item.dart';

class LearningItemListView extends StatelessWidget {
  const LearningItemListView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit, TaskState>(
      listener: (context, state) {},
      builder: (context, state) {
        List<TaskModel> tasks = BlocProvider.of<TaskCubit>(context).tasks ?? [];
        List<TaskModel> filteredTasks = tasks.where((task) {
          return task.category == "Learning";
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
