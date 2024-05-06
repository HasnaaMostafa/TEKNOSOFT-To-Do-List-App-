import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/widgets/add_task_button.dart';
import '../../../data/models/task_model.dart';
import '../../manager/add_task_cubit/add_task_cubit.dart';
import '../../manager/add_task_cubit/add_task_state.dart';
import 'custom_date_text_field.dart';
import 'custom_drop_menu_category.dart';
import 'custom_text_field.dart';
import 'custom_time_text_fields.dart';

class BuildTaskDetails extends StatelessWidget {
  const BuildTaskDetails({
    super.key,
    required this.buttonName,
  });

  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          onSaved: (value) {
            title = value;
          },
          hintN: "Enter Title Here",
        ),
        const CustomDateTextField(),
        const Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "From",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff6783d2),
                  ),
                ),
                CustomTimeTextFields(
                  isFrom: true,
                ),
              ],
            )),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "To",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff6783d2),
                  ),
                ),
                CustomTimeTextFields(
                  isFrom: false,
                ),
              ],
            )),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            )
            // ColorListView(),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        BlocBuilder<AddTaskCubit, AddTaskState>(
          builder: (context, state) {
            return AddTaskButton(
              isLoading: state is AddTaskLoadingState ? true : false,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();

                  var taskModel = TaskModel(
                      priority: "",
                      isCompleted: false,
                      date: date!,
                      time: "$timeFrom:$timeTo",
                      title: title!,
                      category: category!);

                  BlocProvider.of<AddTaskCubit>(context).addTask(taskModel);
                } else {
                  autoValidateMode = AutovalidateMode.always;
                }
              },
              buttonName: buttonName,
            );
          },
        ),
      ],
    );
  }
}
