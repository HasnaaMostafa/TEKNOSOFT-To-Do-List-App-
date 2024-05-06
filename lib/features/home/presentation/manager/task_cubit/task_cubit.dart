import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:teknosoft/features/home/presentation/manager/task_cubit/task_state.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../task/data/models/task_model.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitialState());

  List<TaskModel>? tasks;
  fetchTasks() {
    var noteBox = Hive.box<TaskModel>(kTasksBox);

    tasks = noteBox.values.toList();
    emit(TaskSuccessState());
  }
}
