import 'package:flutter/material.dart';

import '../utils/to_do_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List toDoList = [
    ["manger", false],
    ["dormir", false],
    ["coder", false]
  ];

  void checkBoxChanged(bool? newValue, index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          title: const Text('To Do'),
          elevation: 0,
        ),
        body: ListView.builder(
            itemCount: toDoList.length,
            itemBuilder: (context, index) {
              return ToDoList(
                taskName: toDoList[index][0],
                taskValue: toDoList[index][1],
                onChanged: (newValue) => checkBoxChanged(newValue, index),
              );
            }));
  }
}
