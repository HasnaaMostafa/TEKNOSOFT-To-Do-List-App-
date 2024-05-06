import 'package:flutter/material.dart';

class CustomTaskAppBar extends StatelessWidget {
  const CustomTaskAppBar({
    super.key,
    required this.formKey,
    required this.title,
    required this.onPressed,
  });

  final GlobalKey<FormState> formKey;

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: const SizedBox(),
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          color: Color(0xff6783d2),
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              onPressed: onPressed,
              icon: const Icon(Icons.check),
            ),
          ),
        ),
      ],
    );
  }
}
