import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teknosoft/features/home/presentation/manager/task_cubit/task_cubit.dart';
import 'package:teknosoft/features/home/presentation/manager/task_cubit/task_state.dart';
import 'package:teknosoft/features/search/presentation/views/widgets/search_task_item_list_view.dart';
import 'package:teknosoft/features/task/presentation/views/widgets/custom_text_field.dart';
import 'package:teknosoft/features/up_coming/presentation/views/widgets/custom_app_bar.dart';

import '../../../../task/data/models/task_model.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe9f0fe),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomAppBar(title: "Search"),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  hintN: "search",
                  controller: searchController,
                  onFieldSubmitted: (value) {
                    setState(() {});
                  },
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {});
                    },
                    icon: const Icon(Icons.search_off),
                  ),
                ),
                if (searchController.text.isNotEmpty)
                  BlocBuilder<TaskCubit, TaskState>(
                    builder: (context, state) {
                      List<TaskModel> tasks =
                          BlocProvider.of<TaskCubit>(context).tasks ?? [];
                      List<TaskModel> filteredTasks = tasks.where((task) {
                        return task.title
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase());
                      }).toList();
                      return filteredTasks.isNotEmpty
                          ? SearchItemListView(
                              filteredTasks: filteredTasks,
                              word: searchController.text,
                            )
                          : const Padding(
                              padding: EdgeInsets.only(top: 50.0),
                              child: Text("Not Found"),
                            );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
