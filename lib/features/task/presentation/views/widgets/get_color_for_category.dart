import 'package:flutter/material.dart';

Color getColorForCategory(String category) {
  switch (category) {
    case "Personal":
      return const Color(0xff6783d2);
    case "Learning":
      return const Color(0xff9d70a7);
    case "Work":
      return const Color(0xff679ba8);
    case "Shopping":
      return const Color(0xfff27c7a);
    default:
      return Colors.grey;
    // default color for other categories
  }
}
