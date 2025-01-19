import 'package:flutter/material.dart';
import 'package:what_todo/data/model/task.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text(task.title),
        leading: CircleAvatar(
          radius: 50,
          // backgroundImage: AssetImage(Assets.bgMobileDark),
          child: IconButton(
            onPressed: () {},
            icon: (task.completed ?? false)
                ? Icon(Icons.check)
                : Icon(Icons.circle_outlined),
          ),
        ),
        trailing: IconButton(onPressed: () {}, icon: Icon(Icons.close)),
      ),
    );
  }
}
