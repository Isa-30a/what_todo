import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:what_todo/config/assets.dart';
import 'package:what_todo/data/model/task.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:what_todo/ui/add_task/view_model/todo_provider.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return ListTile(
      title: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        textAlign: TextAlign.left,
        maxLines: 1,
        style: TextStyle(overflow: TextOverflow.ellipsis),
        controller: controller..text = task.title,
        onEditingComplete: () {
          final newTaskTitle = controller.text;
          Provider.of<TodoProvider>(context, listen: false).updateTask(
            task.copyWith(title: newTaskTitle),
          );
        },
      ),
      leading: CheckButton(task: task.completed),
      trailing: IconButton(
        onPressed: () {
          if (task.id != null) {
            Provider.of<TodoProvider>(context, listen: false)
                .deleteTask(task.id!);
          }
        },
        icon: Icon(Icons.close),
      ),
    );
  }
}

class CheckButton extends StatelessWidget {
  const CheckButton({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, value, child) {
        return TextButton(
          onPressed: () {
            Provider.of<TodoProvider>(context, listen: false).updateTask(
              task.copyWith(completed: !task.completed),
            );
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
            child: (task.completed)
                ? SvgPicture.asset(
                    Assets.iconcheck,
                    fit: BoxFit.scaleDown,
                  )
                : CircleAvatar(
                    radius: 1,
                    backgroundColor: Theme.of(context).canvasColor,
                  ),
          ),
        );
      },
    );
  }
}
