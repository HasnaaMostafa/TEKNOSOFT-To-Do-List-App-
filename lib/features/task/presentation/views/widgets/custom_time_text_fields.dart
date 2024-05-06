import 'package:flutter/material.dart';
import 'package:teknosoft/features/task/presentation/views/widgets/time_text_field.dart';

import '../../../../../core/constants/constants.dart';

class CustomTimeTextFields extends StatelessWidget {
  const CustomTimeTextFields({
    super.key,
    this.hintN,
    this.onChange,
    required this.isFrom,
  });

  final String? hintN;
  final void Function(String?)? onChange;
  final bool isFrom;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TimeTextField(
          onChange: onChange,
          onSaved: (value) {
            isFrom ? timeFrom = value : timeTo = value;
          },
          hintN: hintN,
          // onChange: onChange,
        ),
        // const TimeTextField(
        //   fieldName: "End Time",
        // )
      ],
    );
  }
}
