import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teknosoft/features/home/presentation/manager/task_cubit/task_state.dart';

import '../../../../my_day/presentation/views/day_view.dart';
import '../../../../task/data/models/task_model.dart';
import '../../manager/task_cubit/task_cubit.dart';

class MyDayContainer extends StatelessWidget {
  const MyDayContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return const DayView();
        }));
      },
      child: ListTile(
        leading: const Icon(
          Icons.wb_sunny,
          color: Color(0xff4d6bc2),
        ),
        title: const Text(
          "My Day",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xff4d6bc2)),
        ),
        subtitle: BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            List<TaskModel> tasks =
                BlocProvider.of<TaskCubit>(context).tasks ?? [];
            List<TaskModel> filteredTasks = tasks.where((task) {
              DateTime taskDate = DateTime.parse(task.date);
              return taskDate.year == DateTime.now().year &&
                  taskDate.month == DateTime.now().month &&
                  taskDate.day == DateTime.now().day &&
                  task.isCompleted == false;
            }).toList();
            int tasksNum = filteredTasks.length;

            return Text(
              "$tasksNum tasks",
              style: const TextStyle(color: Colors.grey),
            );
          },
        ),
      ),
    );
  }
}
