import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:what_todo/config/settings/settings_controller.dart';
import 'package:what_todo/data/model/task.dart';
import 'package:what_todo/ui/add_task/view_model/todo_provider.dart';
import 'package:what_todo/ui/core/ui/check_button.dart';

class NewTodoWidget extends StatefulWidget {
  const NewTodoWidget({super.key, required this.settingsController});
  final SettingsController settingsController;

  @override
  State<NewTodoWidget> createState() => _NewTodoWidgetState();
}

class _NewTodoWidgetState extends State<NewTodoWidget> {
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Card(
      color: widget.settingsController.themeMode == ThemeMode.light
          ? Colors.white
          : Colors.amber,
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
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
          ),
          style: TextStyle(color: Colors.black87),
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
