import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teknosoft/features/home/presentation/manager/task_cubit/task_state.dart';

import '../../../../task/data/models/task_model.dart';
import '../../../../up_coming/presentation/views/upcoming_view.dart';
import '../../manager/task_cubit/task_cubit.dart';

class UpComingContainer extends StatelessWidget {
  const UpComingContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return const UpComingView();
        }));
      },
      child: ListTile(
        leading: const Icon(
          Icons.calendar_month,
          color: Color(0xff4d6bc2),
        ),
        title: const Text(
          "Upcoming",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xff4d6bc2)),
        ),
        subtitle: BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            List<TaskModel> tasks =
                BlocProvider.of<TaskCubit>(context).tasks ?? [];
            return Text(
              "${tasks.length} tasks",
              style: const TextStyle(color: Colors.grey),
            );
          },
        ),
      ),
    );
  }
}
