import 'package:flutter/material.dart';
import 'package:to_do/utils/create_new_task.dart';

import '../utils/to_do_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List toDoList = [];
  final taskController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          title: const Text('To Do'),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
            onPressed:() {AlertD}, child: const Icon(Icons.add)),
        body: ListView.builder(
            itemCount: toDoList.length,
            itemBuilder: (context, index) {
              return ToDoList(
                taskName: toDoList[index][0],
                taskValue: toDoList[index][1],
                onChanged: (newValue) => {
                  setState(() {
                    toDoList[index][1] = !toDoList[index][1];
                  })
                },
              );
            }));
  }
}
   /*   floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return SimpleDialog(children: [
                  Text("Ajouter une tâche"),
                  TextField(
                    controller: taskController, // Utilisez le contrôleur ici
                    decoration: InputDecoration(
                        hintText: "Entrez le nom de la tâche ici"),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          toDoList.add([
                            taskController.text,
                            false
                          ]); // Utilisez la valeur du contrôleur ici
                          taskController
                              .clear(); // Effacez le texte du contrôleur
                        });
                        Navigator.of(context).pop();
                      },
                      child: Text("data"))
                ]);
              });
        },
      ),
    );
  }
}
*/