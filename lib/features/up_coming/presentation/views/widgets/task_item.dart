import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teknosoft/features/important/presentation/views/widgets/get_icon_for_priority.dart';
import 'package:teknosoft/features/task/data/models/task_model.dart';

import '../../../../home/presentation/manager/task_cubit/task_cubit.dart';
import '../../../../home/presentation/views/widgets/show_modal_bottom_sheet_options.dart';
import '../../../../important/presentation/views/widgets/show_modal_bottom_sheet_priority.dart';
import '../../../../task/presentation/views/widgets/get_color_for_category.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({super.key, required this.taskModel});

  final TaskModel taskModel;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showTaskBottomSheetOptions(context, widget.taskModel);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Container(
          height: 100,
          width: double.infinity,
          decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18))),
          child: Column(
            children: [
              ListTile(
                  leading: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      setState(() {
                        widget.taskModel.isCompleted =
                            !widget.taskModel.isCompleted;

                        widget.taskModel.save();
                        BlocProvider.of<TaskCubit>(context).fetchTasks();
                      });
                    },
                    icon: widget.taskModel.isCompleted
                        ? const Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Icon(
                                Icons.circle_outlined,
                                size: 50,
                                color: Color(0xffa9b4db),
                              ),
                              Icon(
                                Icons.check,
                                size: 25,
                                color: Colors.green,
                              ),
                            ],
                          )
                        : const Icon(
                            Icons.circle_outlined,
                            size: 50,
                            color: Color(0xffa9b4db),
                          ),
                  ),
                  title: Text(
                    widget.taskModel.title,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff4d6bc2)),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          widget.taskModel.time,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color:
                                getColorForCategory(widget.taskModel.category),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.taskModel.category,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          showTaskBottomSheetPriority(
                              context, widget.taskModel);
                        });
                      },
                      icon: getIconForPriority(widget.taskModel.priority))),
            ],
          ),
        ),
      ),
    );
  }
}
