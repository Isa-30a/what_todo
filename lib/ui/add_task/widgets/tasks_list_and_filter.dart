import 'package:flutter/material.dart';
import 'package:what_todo/ui/add_task/widgets/tasks_list_view.dart';

class TasksListAndFilter extends StatelessWidget {
  const TasksListAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    Widget filterTab = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(onPressed: () {}, child: Text('All')),
        TextButton(onPressed: () {}, child: Text('Active')),
        TextButton(onPressed: () {}, child: Text('Completed'))
      ],
    );
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth;

        return Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: TasksListView(child: maxWidth >= 600 ? filterTab : null),
              ),
            ),
            if (maxWidth < 600) Card(child: filterTab),
          ],
        );
      },
    );
  }
}
