import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:what_todo/config/assets.dart';
import 'package:what_todo/data/model/task.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:what_todo/ui/add_task/view_model/todo_provider.dart';
import 'package:what_todo/ui/core/ui/check_button.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    bool isHovered = false;
    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: ListTile(
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
            leading: CheckButton(task: task),
            trailing: isHovered
                ? IconButton(
                    onPressed: () {
                      if (task.id != null) {
                        Provider.of<TodoProvider>(context, listen: false)
                            .deleteTask(task.id!);
                      }
                    },
                    icon: Icon(Icons.close),
                  )
                : null,
          ),
        );
      },
    );
  }
}
