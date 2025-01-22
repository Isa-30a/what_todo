import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:what_todo/config/assets.dart';
import 'package:what_todo/data/model/task.dart';
import 'package:what_todo/ui/add_task/view_model/todo_provider.dart';

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
