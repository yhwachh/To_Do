import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ToDoList extends StatelessWidget {
  bool taskValue = false;
  String taskName;
  Function(bool?)? onChanged;

  ToDoList(
      {super.key,
      required this.taskName,
      this.onChanged,
      required this.taskValue});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30, top: 20),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Checkbox(
              value: taskValue,
              onChanged: onChanged,
              activeColor: Colors.black,
            ),
            Text(
              taskName,
              style: TextStyle(
                  decoration: taskValue ? TextDecoration.lineThrough : null),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.yellow, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
