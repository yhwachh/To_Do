import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onSave;

  DialogBox({super.key, required this.controller, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: Container(
        height: 120,
        child: Column(children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(
                hintText: 'Enter Task Name', border: OutlineInputBorder()),
          ),
          Row(
            children: [
              ElevatedButton(child: Text(' Add Task '), onPressed: onSave),
              const SizedBox(
                width: 40,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel Task'))
            ],
          )
        ]),
      ),
    );
  }
}
