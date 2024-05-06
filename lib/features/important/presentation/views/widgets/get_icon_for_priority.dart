import 'package:flutter/material.dart';

Icon getIconForPriority(String category) {
  switch (category) {
    case "High":
      return Icon(
        color: Colors.yellow.shade700,
        Icons.star,
        size: 30,
      );
    case "Medium":
      return Icon(
        color: Colors.yellow.shade500,
        Icons.star,
        size: 30,
      );
    case "Low":
      return Icon(
        color: Colors.yellow.shade200,
        Icons.star,
        size: 30,
      );
    case "":
      return const Icon(
        color: Color(0xff679ba8),
        Icons.star_border,
        size: 30,
      );
    default:
      return const Icon(
        color: Color(0xff679ba8),
        Icons.star_border,
        size: 30,
      );
  }
}
