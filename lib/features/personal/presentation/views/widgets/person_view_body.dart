import 'package:flutter/material.dart';
import 'package:teknosoft/features/personal/presentation/views/widgets/person_item_list_view.dart';
import 'package:teknosoft/features/up_coming/presentation/views/widgets/custom_app_bar.dart';

class PersonViewBody extends StatelessWidget {
  const PersonViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffe9f0fe),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 20.0, left: 20, top: 10),
          child: Column(
            children: [
              CustomAppBar(title: "Personal Tasks"),
              Expanded(child: PersonItemListView())
            ],
          ),
        ),
      ),
    );
  }
}
