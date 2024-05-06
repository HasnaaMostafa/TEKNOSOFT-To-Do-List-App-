abstract class AddTaskState {}

class AddTaskInitialState extends AddTaskState {}

class AddTaskLoadingState extends AddTaskState {}

class AddTaskSuccessState extends AddTaskState {}

class AddTaskErrorState extends AddTaskState {
  final String error;
  AddTaskErrorState({required this.error});
}

class AddTaskColorChangedState extends AddTaskState {
  AddTaskColorChangedState();
}
