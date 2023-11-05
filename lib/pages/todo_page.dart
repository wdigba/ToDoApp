import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/utilites/dialog_box.dart';
import 'package:to_do_app/utilites/todo_tile.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  final myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDb();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([controller.text, false]);
      controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDb();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
              controller: controller,
              onSave: saveNewTask,
              onCancel: () => Navigator.of(context).pop());
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal.shade200,
        appBar: AppBar(
          title: Center(
            child: Text("TO DO"),
          ),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
            elevation: 0,
            onPressed: createNewTask,
            child: Icon(
              Icons.add,
              color: Colors.black,
            )),
        body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          },
        ));
  }
}
