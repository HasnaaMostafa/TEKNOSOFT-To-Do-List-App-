import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teknosoft/features/home/presentation/manager/task_cubit/task_cubit.dart';
import 'package:teknosoft/features/home/presentation/manager/task_cubit/task_state.dart';
import 'package:teknosoft/features/important/presentation/views/important_view.dart';

import '../../../../task/data/models/task_model.dart';

class ImportantContainer extends StatelessWidget {
  const ImportantContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return const ImportantView();
        }));
      },
      child: ListTile(
        leading: const Icon(
          Icons.star,
          color: Color(0xff4d6bc2),
        ),
        title: const Text(
          "Important",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xff4d6bc2)),
        ),
        subtitle: BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            List<TaskModel> tasks =
                BlocProvider.of<TaskCubit>(context).tasks ?? [];

            int highPriorityCount = 0;
            int mediumPriorityCount = 0;
            int lowPriorityCount = 0;

            for (var task in tasks) {
              if (task.priority == 'High') {
                highPriorityCount++;
              } else if (task.priority == 'Medium') {
                mediumPriorityCount++;
              } else if (task.priority == 'Low') {
                lowPriorityCount++;
              }
            }

            return Text(
              "${highPriorityCount + mediumPriorityCount + lowPriorityCount} tasks",
              style: const TextStyle(color: Colors.grey),
            );
          },
        ),
      ),
    );
  }
}
