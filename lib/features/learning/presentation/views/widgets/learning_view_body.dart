import 'package:flutter/material.dart';
import 'package:teknosoft/features/up_coming/presentation/views/widgets/custom_app_bar.dart';

import 'learning_item_list_view.dart';

class LearningViewBody extends StatelessWidget {
  const LearningViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffe9f0fe),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 20.0, left: 20, top: 10),
          child: Column(
            children: [
              CustomAppBar(title: "Learning Tasks"),
              Expanded(child: LearningItemListView())
            ],
          ),
        ),
      ),
    );
  }
}
