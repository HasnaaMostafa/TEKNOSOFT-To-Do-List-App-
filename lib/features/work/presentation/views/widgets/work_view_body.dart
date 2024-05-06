import 'package:flutter/material.dart';
import 'package:teknosoft/features/up_coming/presentation/views/widgets/custom_app_bar.dart';
import 'package:teknosoft/features/work/presentation/views/widgets/work_item_list_view.dart';

class WorkViewBody extends StatelessWidget {
  const WorkViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffe9f0fe),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 20.0, left: 20, top: 10),
          child: Column(
            children: [
              CustomAppBar(title: "Work Tasks"),
              Expanded(child: WorkItemListView())
            ],
          ),
        ),
      ),
    );
  }
}
