import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teknosoft/features/important/presentation/views/widgets/custom_drop_menu_priority.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../home/presentation/manager/task_cubit/task_cubit.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, this.isImportant});

  final String title;

  final bool? isImportant;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          const Spacer(),
          Center(
            child: Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Color(0xff6783d2)),
            ),
          ),
          const Spacer(),
          isImportant ?? false
              ? CustomDropMenuOfPriority(
                  priorityList: priorityList,
                  onChange: (value) {
                    priority = value;
                    BlocProvider.of<TaskCubit>(context).fetchTasks();
                  },
                )
              : const SizedBox(
                  width: 50,
                )
        ],
      ),
    );
  }
}
