import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:what_todo/config/assets.dart';
import 'package:what_todo/data/model/task.dart';
import 'package:what_todo/ui/add_task/view_model/todo_provider.dart';

class NewTodoWidget extends StatefulWidget {
  const NewTodoWidget({
    super.key,
  });

  @override
  State<NewTodoWidget> createState() => _NewTodoWidgetState();
}

class _NewTodoWidgetState extends State<NewTodoWidget> {
  @override
  Widget build(BuildContext context) {
    bool isCompleted = false;
    final controller = TextEditingController();

    return Card(
      child: ListTile(
        leading: StatefulBuilder(
          builder: (context, setState) {
            return TextButton(
              onPressed: () {
                setState(() {
                  isCompleted = !isCompleted;
                });
              },
              child: (isCompleted)
                  ? SvgPicture.asset(Assets.iconcheck)
                  : Icon(Icons.circle_outlined),
            );
          },
        ),
        title: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Create a new todo...',
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
