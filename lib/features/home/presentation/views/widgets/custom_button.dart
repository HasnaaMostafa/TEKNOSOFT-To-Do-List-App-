import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.backgroundColor,
      required this.buttonName,
      required this.onTap,
      required this.color});

  final Color backgroundColor;
  final String buttonName;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, right: 25, left: 25),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: backgroundColor, borderRadius: BorderRadius.circular(20)),
          child: Center(
              child: Text(
            buttonName,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: color),
          )),
        ),
      ),
    );
  }
}
