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
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Card(
      child: ListTile(
        leading: TextButton(
          onPressed: () {
            setState(() {
              isCompleted = !isCompleted;
            });
          },
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            height: 30,
            width: 30,
            child: (isCompleted)
                ? SvgPicture.asset(
                    Assets.iconcheck,
                    fit: BoxFit.scaleDown,
                  )
                : CircleAvatar(
                    radius: 1,
                    backgroundColor: Theme.of(context).canvasColor,
                  ),
          ),
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
