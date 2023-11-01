import 'package:hive/hive.dart';

class ToDoDataBase {
  List toDoList = [];

  final myBox = Hive.box('mybox');

  //first time opening the app
  void createInitialData() {
    toDoList = [
      ["go for a walk", false],
      ["call mom", false],
    ];
  }

  //load data from db
  void loadData() {
    toDoList = myBox.get("TODOLIST");
  }

  //update the database
  void updateDb() {
    myBox.put("TODOLIST", toDoList);
  }
}
