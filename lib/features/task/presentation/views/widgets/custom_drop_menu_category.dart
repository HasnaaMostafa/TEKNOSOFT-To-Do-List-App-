import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import 'custom_text_field.dart';

class CustomDropMenuOfCategory extends StatefulWidget {
  const CustomDropMenuOfCategory({
    super.key,
    required this.categoryList,
    this.hintN,
    this.onChange,
  });

  final List<String> categoryList;

  final String? hintN;
  final void Function(String?)? onChange;

  @override
  State<CustomDropMenuOfCategory> createState() =>
      _CustomDropMenuOfCategoryState();
}

class _CustomDropMenuOfCategoryState extends State<CustomDropMenuOfCategory> {
  @override
  void initState() {
    super.initState();
    categoryController.text = widget.hintN ?? widget.categoryList[0];
  }

  String? selectedValue;
  TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      onChange: (value) {
        if (widget.onChange != null) {
          widget.onChange!(value);
        }
      },
      onSaved: (value) {
        category = value;
      },
      controller: categoryController,
      hintN: widget.hintN ?? selectedValue ?? categoryList[0],
      suffixIcon: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        icon: DropdownButton<String>(
          padding: EdgeInsets.zero,
          underline: const SizedBox(
            width: 0,
          ),
          value: selectedValue ?? categoryList[0],
          style: const TextStyle(color: Colors.grey),
          onChanged: (String? value) {
            setState(() {
              selectedValue = value;
              categoryController.text = value!;
            });
            if (widget.onChange != null) {
              widget.onChange!(value);
            }
          },
          items:
              widget.categoryList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          icon: const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.keyboard_arrow_down),
          ),
        ),
      ),
    );
  }
}
