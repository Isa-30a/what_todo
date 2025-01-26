import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:what_todo/data/model/task.dart';
import 'package:what_todo/ui/add_task/view_model/todo_provider.dart';
import 'package:what_todo/ui/core/ui/check_button.dart';

class NewTodoWidget extends StatefulWidget {
  const NewTodoWidget({super.key});

  @override
  State<NewTodoWidget> createState() => _NewTodoWidgetState();
}

class _NewTodoWidgetState extends State<NewTodoWidget> {
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Card(
      child: ListTile(
        leading: CheckButton(
          onPressed: () {
            setState(() {
              isCompleted = !isCompleted;
            });
          },
          isCompleted: isCompleted,
        ),
        title: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Create a new todo...',
          ),
          style: TextStyle(
            color: Colors.black87,
          ),
          textAlign: TextAlign.left,
          maxLines: 1,
          controller: controller,
          onEditingComplete: () {
            final taskTitle = controller.text;
            Provider.of<TodoProvider>(context, listen: false).insertTask(
              Task(title: taskTitle, completed: isCompleted),
            );
            isCompleted = false;
            controller.clear();
          },
        ),
      ),
    );
  }
}
