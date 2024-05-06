import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';

class CustomDropMenuOfPriority extends StatefulWidget {
  const CustomDropMenuOfPriority({
    super.key,
    required this.priorityList,
    this.hintN,
    this.onChange,
  });

  final List<String> priorityList;

  final String? hintN;
  final void Function(String?)? onChange;

  @override
  State<CustomDropMenuOfPriority> createState() =>
      _CustomDropMenuOfPriorityState();
}

class _CustomDropMenuOfPriorityState extends State<CustomDropMenuOfPriority> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      icon: buildDropdownButton(),
    );
  }

  DropdownButton<String> buildDropdownButton() {
    return DropdownButton<String>(
      padding: EdgeInsets.zero,
      underline: const SizedBox(
        width: 0,
      ),
      value: priority ?? priorityList[0],
      style: const TextStyle(color: Colors.grey),
      onChanged: (String? value) {
        setState(() {
          selectedValue = value;
        });
        if (widget.onChange != null) {
          widget.onChange!(value);
        }
      },
      items: widget.priorityList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      icon: const Padding(
        padding: EdgeInsets.only(right: 8.0),
        child: Icon(Icons.keyboard_arrow_down),
      ),
    );
  }
}
