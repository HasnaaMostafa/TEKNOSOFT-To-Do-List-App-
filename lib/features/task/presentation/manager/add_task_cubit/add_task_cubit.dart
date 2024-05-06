import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../../../core/constants/constants.dart';
import '../../../data/models/task_model.dart';
import 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitialState());

  Color color = const Color(0xff095256);

  addTask(TaskModel taskModel) async {
    emit(AddTaskLoadingState());
    try {
      var taskBox = Hive.box<TaskModel>(kTasksBox);

      await taskBox.add(taskModel);
      emit(AddTaskSuccessState());
    } catch (error) {
      emit(AddTaskErrorState(error: error.toString()));
    }
  }
}
