import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do/data/database.dart';
import 'package:to_do/utils/create_new_task.dart';
import '../utils/to_do_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // reference hive box
  final _myBox = Hive.box('myBox');

  ToDoDataBase toDoDataBase = ToDoDataBase();

  final taskController = TextEditingController();

  @override
  void initState() {
    // if this 1st tiome openin the app
    if (_myBox.get("toDoList") == null) {
      toDoDataBase.createInitialData();
      toDoDataBase.updateDataBase();
    } else {
      // there already exist data
      toDoDataBase.loadData();
    }
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    taskController.dispose();
    super.dispose();
  }

  void saveNewTask() {
    setState(() {
      if (taskController.text.isEmpty) {
        Navigator.of(context).pop();
        return;
      }
      toDoDataBase.toDoList.add([taskController.text, false]);
      taskController.clear();
      Navigator.of(context).pop();
    });
    toDoDataBase.updateDataBase();
  }

  void creatNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: taskController,
            onSave: saveNewTask,
          );
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
          itemCount: toDoDataBase.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoList(
              taskName: toDoDataBase.toDoList[index][0],
              taskValue: toDoDataBase.toDoList[index][1],
              onChanged: (newValue) => {
                setState(() {
                  toDoDataBase.toDoList[index][1] =
                      !toDoDataBase.toDoList[index][1];
                }),
                toDoDataBase.updateDataBase()
              },
              deleteFonction: (BuildContext) {
                setState(() {
                  toDoDataBase.toDoList.removeAt(index);
                });
                toDoDataBase.updateDataBase();
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: creatNewTask, child: const Icon(Icons.add)),
    );
  }
}
