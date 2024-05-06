import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:teknosoft/features/home/presentation/manager/task_cubit/task_cubit.dart';
import 'package:teknosoft/features/home/presentation/manager/task_cubit/task_state.dart';

import '../../../../search/presentation/views/search_view.dart';
import '../../../../task/data/models/task_model.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({
    super.key,
  });

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  ValueNotifier<double> progressNotifier = ValueNotifier<double>(0.0);

  @override
  void initState() {
    super.initState();
    progressNotifier.addListener(() {
      print("Progress updated: ${progressNotifier.value}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 10),
      child: Column(
        children: [
          Row(
            children: [
              const Text("lists",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 28)),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const SearchView();
                    }));
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 35,
                  )),
              const CircleAvatar(
                backgroundImage: AssetImage("assets/images/person.jpeg"),
                radius: 20,
                backgroundColor: Colors.black,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              BlocBuilder<TaskCubit, TaskState>(
                builder: (context, state) {
                  List<TaskModel> tasks =
                      BlocProvider.of<TaskCubit>(context).tasks ?? [];
                  List<TaskModel> filteredDailyTasks = tasks.where((task) {
                    DateTime taskDate = DateTime.parse(task.date);
                    return taskDate.year == DateTime.now().year &&
                        taskDate.month == DateTime.now().month &&
                        taskDate.day == DateTime.now().day;
                  }).toList();

                  List<TaskModel> filteredCompletedTasks = tasks.where((task) {
                    DateTime taskDate = DateTime.parse(task.date);
                    return taskDate.year == DateTime.now().year &&
                        taskDate.month == DateTime.now().month &&
                        taskDate.day == DateTime.now().day &&
                        task.isCompleted == true;
                  }).toList();
                  double progress = filteredDailyTasks.isNotEmpty
                      ? (filteredCompletedTasks.length /
                              filteredDailyTasks.length) *
                          100
                      : 0.0;
                  progressNotifier.value = progress;
                  return SimpleCircularProgressBar(
                    valueNotifier: progressNotifier,
                    mergeMode: true,
                    startAngle: 0,
                    size: 20,
                    progressColors: const [Color(0xff4d6bc2)],
                    progressStrokeWidth: 5,
                    backStrokeWidth: 4,
                    backColor: Colors.grey,
                  );
                },
              ),
              const SizedBox(
                width: 7,
              ),
              const Text(
                "Today's Progress",
                style: TextStyle(
                  color: Color(0xff4d6bc2),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              BlocBuilder<TaskCubit, TaskState>(
                builder: (context, state) {
                  List<TaskModel> tasks =
                      BlocProvider.of<TaskCubit>(context).tasks ?? [];
                  List<TaskModel> filteredDailyTasks = tasks.where((task) {
                    DateTime taskDate = DateTime.parse(task.date);
                    return taskDate.year == DateTime.now().year &&
                        taskDate.month == DateTime.now().month &&
                        taskDate.day == DateTime.now().day;
                  }).toList();

                  List<TaskModel> filteredCompletedTasks = tasks.where((task) {
                    DateTime taskDate = DateTime.parse(task.date);
                    return taskDate.year == DateTime.now().year &&
                        taskDate.month == DateTime.now().month &&
                        taskDate.day == DateTime.now().day &&
                        task.isCompleted == true;
                  }).toList();
                  return Text(
                    "${filteredDailyTasks.length - filteredCompletedTasks.length} tasks left",
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  );
                },
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.grey.shade300,
          ),
        ],
      ),
    );
  }
}
