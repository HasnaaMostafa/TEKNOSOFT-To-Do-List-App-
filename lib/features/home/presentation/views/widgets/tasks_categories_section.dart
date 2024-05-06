import 'package:flutter/material.dart';
import 'package:teknosoft/features/home/presentation/views/widgets/task_category_item.dart';
import 'package:teknosoft/features/learning/presentation/views/learning_view.dart';
import 'package:teknosoft/features/personal/presentation/views/person_view.dart';
import 'package:teknosoft/features/shopping/presentation/views/shopping_view.dart';
import 'package:teknosoft/features/work/presentation/views/work_view.dart';

class TasksCategoriesSection extends StatelessWidget {
  const TasksCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        childAspectRatio: 3 / 2.6,
        padding: EdgeInsets.zero,
        children: [
          TaskCategoryItem(
            color: const Color(0xff6783d2),
            icon: Icons.person,
            name: "Personal",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const PersonCategoryView()));
            },
          ),
          TaskCategoryItem(
            color: const Color(0xff9d70a7),
            icon: Icons.edit,
            name: "Learning",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const LearningCategoryView()));
            },
          ),
          TaskCategoryItem(
            color: const Color(0xff679ba8),
            icon: Icons.work,
            name: "Work",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const WorkCategoryView()));
            },
          ),
          TaskCategoryItem(
            color: const Color(0xfff27c7a),
            icon: Icons.shopping_basket,
            name: "Shopping",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const ShoppingCategoryView()));
            },
          )
        ]);
  }
}
