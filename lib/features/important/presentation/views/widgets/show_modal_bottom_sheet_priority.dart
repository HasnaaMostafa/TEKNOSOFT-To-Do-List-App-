import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/presentation/manager/task_cubit/task_cubit.dart';
import '../../../../home/presentation/views/widgets/custom_button.dart';
import '../../../../task/data/models/task_model.dart';

void showTaskBottomSheetPriority(BuildContext context, TaskModel taskModel) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      context: context,
      backgroundColor: const Color(0xffe9f0fe),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                width: 100,
                child: Divider(
                  thickness: 5,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              CustomButton(
                color: const Color(0xff9d70a7),
                onTap: () {
                  taskModel.priority = "High";
                  taskModel.save();
                  BlocProvider.of<TaskCubit>(context).fetchTasks();
                  Navigator.pop(context);
                },
                backgroundColor: Colors.white,
                buttonName: "High",
              ),
              CustomButton(
                color: const Color(0xff9d70a7),
                onTap: () {
                  taskModel.priority = "Medium";
                  taskModel.save();
                  BlocProvider.of<TaskCubit>(context).fetchTasks();
                  Navigator.pop(context);
                },
                backgroundColor: Colors.white,
                buttonName: "Medium",
              ),
              CustomButton(
                color: const Color(0xff9d70a7),
                onTap: () {
                  taskModel.priority = "Low";
                  taskModel.save();
                  BlocProvider.of<TaskCubit>(context).fetchTasks();
                  Navigator.pop(context);
                },
                backgroundColor: Colors.white,
                buttonName: "Low",
              ),
              CustomButton(
                color: const Color(0xff9d70a7),
                onTap: () {
                  taskModel.priority = "";
                  taskModel.save();
                  BlocProvider.of<TaskCubit>(context).fetchTasks();
                  Navigator.pop(context);
                },
                backgroundColor: Colors.white,
                buttonName: "Undo",
              ),
            ],
          ),
        );
      });
}
