import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teknosoft/features/task/data/models/task_model.dart';
import 'package:teknosoft/features/task/presentation/views/widgets/custom_drop_menu_category.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../home/presentation/manager/task_cubit/task_cubit.dart';
import '../../../../task/presentation/views/widgets/custom_date_text_field.dart';
import '../../../../task/presentation/views/widgets/custom_task_app_bar.dart';
import '../../../../task/presentation/views/widgets/custom_text_field.dart';
import '../../../../task/presentation/views/widgets/custom_time_text_fields.dart';

class EditTaskViewBody extends StatefulWidget {
  const EditTaskViewBody({
    super.key,
    required this.taskModel,
  });

  final TaskModel taskModel;

  @override
  State<EditTaskViewBody> createState() => _EditTaskViewBodyState();
}

class _EditTaskViewBodyState extends State<EditTaskViewBody> {
  String? title, category, timeTo, date, timeFrom;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autoValidateMode,
      key: formKey,
      child: Scaffold(
        backgroundColor: const Color(0xffe9f0fe),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomTaskAppBar(
                formKey: formKey,
                title: "Edit Task",
                onPressed: () {
                  widget.taskModel.title = title ?? widget.taskModel.title;
                  widget.taskModel.category =
                      category ?? widget.taskModel.category;
                  widget.taskModel.date = date ?? widget.taskModel.date;
                  if (timeTo == null && timeFrom == null) {
                    widget.taskModel.time = widget.taskModel.time;
                  } else if (timeTo == null && timeFrom != null) {
                    widget.taskModel.time =
                        "$timeFrom:${widget.taskModel.time.substring(9)}";
                  } else if (timeTo != null && timeFrom == null) {
                    widget.taskModel.time =
                        "${widget.taskModel.time.substring(0, 7)}:$timeTo";
                  } else {
                    widget.taskModel.time = "$timeFrom:$timeTo";
                  }
                  widget.taskModel.save();

                  BlocProvider.of<TaskCubit>(context).fetchTasks();
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 23, vertical: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Title",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff6783d2),
                      ),
                    ),
                    CustomTextField(
                      onChange: (value) {
                        title = value;
                      },
                      hintN: widget.taskModel.title,
                    ),
                    const Text(
                      "Date",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff6783d2),
                      ),
                    ),
                    CustomDateTextField(
                      onChange: (value) {
                        date = value;
                      },
                      hintN: widget.taskModel.date,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "From",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff6783d2),
                              ),
                            ),
                            CustomTimeTextFields(
                              hintN: widget.taskModel.time.substring(0, 7),
                              onChange: (value) {
                                timeFrom = value;
                                print(value);
                              },
                              isFrom: true,
                            ),
                          ],
                        )),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "To",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff6783d2),
                              ),
                            ),
                            CustomTimeTextFields(
                              hintN: widget.taskModel.time.substring(8),
                              isFrom: false,
                              onChange: (value) {
                                timeTo = value;
                                print(value);
                              },
                            ),
                          ],
                        )),
                      ],
                    ),
                    const Text(
                      "Category",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff6783d2),
                      ),
                    ),
                    CustomDropMenuOfCategory(
                      categoryList: categoryList,
                      onChange: (value) {
                        category = value;
                      },
                      hintN: widget.taskModel.category,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
