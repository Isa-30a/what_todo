import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:what_todo/data/model/task.dart';
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
        final isMobile = MediaQuery.of(context).size.width < 600;
        if (isMobile) {
          isHovered = true;
        }
        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: ListTile(
            leading: CheckButton(
              isCompleted: task.completed,
              onPressed: () {
                Provider.of<TodoProvider>(context, listen: false).updateTask(
                  task.copyWith(completed: !task.completed),
                );
              },
            ),
            title: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              textAlign: TextAlign.left,
              maxLines: 1,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: task.completed ? Colors.grey : Colors.black87,
                decoration: task.completed
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                decorationColor: task.completed ? Colors.grey : null,
              ),
              controller: controller..text = task.title,
              onEditingComplete: () {
                final newTaskTitle = controller.text;
                Provider.of<TodoProvider>(context, listen: false).updateTask(
                  task.copyWith(title: newTaskTitle),
                );
              },
            ),
            trailing: isHovered
                ? IconButton(
                    onPressed: () {
                      if (task.id != null) {
                        Provider.of<TodoProvider>(context, listen: false)
                            .deleteTask(task.id!);
                      }
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.grey[600],
                    ),
                  )
                : null,
          ),
        );
      },
    );
  }
}
