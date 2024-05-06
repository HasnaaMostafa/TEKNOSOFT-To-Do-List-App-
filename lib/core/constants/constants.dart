import 'package:flutter/cupertino.dart';

String kTasksBox = "tasks_box";

AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

String? title, category, timeFrom, timeTo, date, priority;

GlobalKey<FormState> formKey = GlobalKey();

bool isLoading = false;

final List<String> categoryList = <String>[
  'Personal',
  'Learning',
  'Work',
  'Shopping',
];

final List<String> priorityList = <String>[
  'High',
  'Medium',
  'Low',
];

List<Color> colors = [
  const Color(0xff095256),
  const Color(0xff087F8C),
  const Color(0xff5AAA95),
  const Color(0xffBB9F06),
  const Color(0xffB07BAC),
  const Color(0xffE9BCB7),
];
