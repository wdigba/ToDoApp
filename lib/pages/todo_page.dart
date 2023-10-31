import 'package:flutter/material.dart';

import '../utilites/todo_tile.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
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
      body: ListView(
        children: [
          ToDoTile(
          taskName: "call mom",
          taskCompleted: true,
          onChanged: (p0)  {},),
        ],
      ),
    );
  }
}
