import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teknosoft/features/home/presentation/manager/task_cubit/task_cubit.dart';
import 'package:teknosoft/features/home/presentation/manager/task_cubit/task_state.dart';

import '../../../../task/data/models/task_model.dart';

class TaskCategoryItem extends StatelessWidget {
  const TaskCategoryItem(
      {super.key,
      required this.color,
      required this.icon,
      required this.name,
      this.onTap});

  final Color color;
  final IconData icon;
  final String name;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, bottom: 10, left: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: ShapeDecoration(
            color: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                ListTile(
                  title: Text(
                    name,
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: BlocBuilder<TaskCubit, TaskState>(
                    builder: (context, state) {
                      List<TaskModel> task =
                          BlocProvider.of<TaskCubit>(context).tasks ?? [];
                      List<TaskModel> filteredTasks = task.where((task) {
                        return task.category == name;
                      }).toList();
                      return Text(
                        "${filteredTasks.length} Tasks",
                        style: const TextStyle(color: Colors.white38),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
