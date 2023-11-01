import 'package:flutter/material.dart';
import 'package:to_do_app/utilites/dialog_box.dart';
import 'package:to_do_app/utilites/todo_tile.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  final controller = TextEditingController();
  List toDoList = [
    ["make coffee", false],
    ["write a poem", false]
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(controller: controller);
        });
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
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
                taskName: toDoList[index][0],
                taskCompleted: toDoList[index][1],
                onChanged: (value) => checkBoxChanged(value, index));
          },
        ));
  }
}
