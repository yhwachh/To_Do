import 'package:hive/hive.dart';

class ToDoDataBase {
  List toDoList = [];
  //reference hive box
  final _myBox = Hive.box('myBox');
  //1es time open this app
  void createInitialData() {
    toDoList = [
      ['dormir', false],
      ['coder', false],
    ];
  }

  // load the data from database

  void loadData() {
    toDoList = _myBox.get('toDoList');
  }

  //update the database
  void updateDataBase() {
    _myBox.put('toDoList', toDoList);
  }
}
