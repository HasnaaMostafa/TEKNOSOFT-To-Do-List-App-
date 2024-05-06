import 'package:flutter/material.dart';

import '../../../../../core/functions/build_border.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.maxLines = 1,
      required this.hintN,
      this.suffixIcon,
      this.onSaved,
      this.onChange,
      this.controller,
      this.onFieldSubmitted});

  final int maxLines;
  final String hintN;
  final IconButton? suffixIcon;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChange;
  final TextEditingController? controller;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 5, bottom: 10),
      child: TextFormField(
        onChanged: onChange,
        onFieldSubmitted: onFieldSubmitted,
        maxLines: maxLines,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.only(left: 10),
          hintText: hintN,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 18),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
          border: buildBorder(),
        ),
        onSaved: onSaved,
        validator: (String? value) {
          if (value?.isEmpty ?? true) {
            return " Field is required";
          } else {
            return null;
          }
        },
        controller: controller,
      ),
    );
  }
}
