import 'package:flutter/material.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key, required this.onTap, this.isLoading = false});

  final VoidCallback onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  Color(0xff6783d2),
                  Color(0xff9d70a7),
                  Color(0xff679ba8),
                  Color(0xfff27c7a)
                ]),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                  child: isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          "",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )),
            ),
          )
        ],
      ),
    );
  }
}
