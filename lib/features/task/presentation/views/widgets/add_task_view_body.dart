import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../home/presentation/manager/task_cubit/task_cubit.dart';
import '../../../data/models/task_model.dart';
import '../../manager/add_task_cubit/add_task_cubit.dart';
import '../../manager/add_task_cubit/add_task_state.dart';
import 'build_task_details.dart';
import 'custom_task_app_bar.dart';

class AddTaskViewBody extends StatelessWidget {
  const AddTaskViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autoValidateMode,
      key: formKey,
      child: Scaffold(
        backgroundColor: const Color(0xffe9f0fe),
        body: Column(
          children: [
            CustomTaskAppBar(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  var taskModel = TaskModel(
                    priority: "",
                    isCompleted: false,
                    date: date!,
                    title: title!,
                    category: category!,
                    time: "$timeFrom:$timeTo",
                  );

                  BlocProvider.of<AddTaskCubit>(context).addTask(taskModel);
                } else {
                  autoValidateMode = AutovalidateMode.always;
                }
              },
              formKey: formKey,
              title: "Add Task",
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 23, vertical: 13),
                child: BlocConsumer<AddTaskCubit, AddTaskState>(
                    listener: (context, state) {
                  if (state is AddTaskErrorState) {
                    debugPrint("failed ${state.error}");
                  }
                  if (state is AddTaskSuccessState) {
                    BlocProvider.of<TaskCubit>(context).fetchTasks();
                    Navigator.pop(context);
                  }
                }, builder: (context, state) {
                  return AbsorbPointer(
                    absorbing: state is AddTaskLoadingState ? true : false,
                    child: const SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: BuildTaskDetails()),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
