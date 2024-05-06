import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/constants/constants.dart';
import 'custom_text_field.dart';

class CustomDateTextField extends StatefulWidget {
  const CustomDateTextField({
    this.onChange,
    super.key,
    this.hintN,
    this.dController,
  });

  final void Function(String?)? onChange;
  final String? hintN;
  final TextEditingController? dController;
  @override
  State<CustomDateTextField> createState() => _CustomDateTextFieldState();
}

class _CustomDateTextFieldState extends State<CustomDateTextField> {
  late DateTime selectedDate;

  late TextEditingController dateController;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    dateController = TextEditingController();
    var currentDate = DateTime.now();
    var formattedDate = _formatDate(currentDate);
    dateController.text = widget.hintN ?? formattedDate;
  }

  String _formatDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    var formattedSelectedDate = _formatDate(selectedDate);
    return CustomTextField(
      onChange: widget.onChange,
      onSaved: (value) {
        date = value;
      },
      controller: widget.dController ?? dateController,
      hintN: widget.hintN ?? formattedSelectedDate,
      suffixIcon: IconButton(
        onPressed: () {
          showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(DateTime.now().year),
                  lastDate: DateTime(DateTime.now().year + 1))
              .then((pickedDate) {
            if (pickedDate != null) {
              setState(() {
                selectedDate = pickedDate;
                var formattedSelectedDate = _formatDate(selectedDate);
                dateController.text = formattedSelectedDate;
              });
              if (widget.onChange != null) {
                widget.onChange!(_formatDate(pickedDate));
              }
            }
          });
        },
        icon: const Icon(Icons.calendar_today_outlined),
      ),
    );
  }
}
