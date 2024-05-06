import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teknosoft/features/home/presentation/manager/task_cubit/task_cubit.dart';

import '../../../../edit_task/presentation/views/widgets/show_modal_button_sheet_edit.dart';
import '../../../../task/data/models/task_model.dart';
import 'custom_button.dart';

void showTaskBottomSheetOptions(BuildContext context, TaskModel taskModel) {
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
                color: const Color(0xff6783d2),
                onTap: () {
                  Navigator.pop(context);
                  showEditTaskBottomSheet(context, taskModel);
                },
                backgroundColor: Colors.white,
                buttonName: "Edit Note",
              ),
              CustomButton(
                color: Colors.white,
                onTap: () async {
                  taskModel.delete().then((value) {
                    BlocProvider.of<TaskCubit>(context).fetchTasks();
                  });
                  Navigator.pop(context);
                },
                backgroundColor: const Color(0xffCD5C5C),
                buttonName: "Delete Note",
              ),
              const SizedBox(
                width: double.infinity,
                child: Divider(
                  thickness: 2,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                color: const Color(0xff6783d2),
                onTap: () {
                  Navigator.pop(context);
                },
                backgroundColor: Colors.white,
                buttonName: "Cancel",
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        );
      });
}
