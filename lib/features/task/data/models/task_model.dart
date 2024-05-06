import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String time;

  @HiveField(2)
  String date;

  @HiveField(3)
  String category;

  @HiveField(4)
  bool isCompleted;

  @HiveField(5)
  String priority;

  TaskModel(
      {required this.title,
      required this.time,
      required this.category,
      required this.date,
      required this.isCompleted,
      required this.priority});
}

//flutter packages pub run build_runner build
