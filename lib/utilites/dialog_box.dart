import 'package:flutter/material.dart';
import 'package:to_do_app/utilites/button.dart';

class DialogBox extends StatelessWidget {
  final controller;

  const DialogBox({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.teal.shade200,
      elevation: 0,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "add your task"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(text: "save", onPressed: () {},),
                const SizedBox(width: 30),
                Button(text: "cancel", onPressed: () {})
              ],
            )
          ],
        ),
      ),
    );
  }
}
