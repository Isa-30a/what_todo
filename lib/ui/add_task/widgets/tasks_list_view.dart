import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:what_todo/ui/add_task/view_model/todo_provider.dart';
import 'package:what_todo/ui/add_task/widgets/task_list_tile.dart';

/// Displays a list of SampleItems.
class TasksListView extends StatelessWidget {
  const TasksListView({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TodoProvider>(
        builder: (context, notifier, child) {
          return RefreshIndicator(
            onRefresh: () async {
              notifier.refresh();
              return;
            },
            child: Card(
              margin: EdgeInsets.all(0),
              child: FutureBuilder(
                future: notifier.futureData,
                builder: (context, snapshot) {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (BuildContext context, int index) =>
                              Divider(color: Theme.of(context).disabledColor),
                          restorationId: 'tasksListView',
                          itemCount:
                              snapshot.hasData ? snapshot.data!.length : 0,
                          itemBuilder: (BuildContext context, int index) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (snapshot.hasData) {
                              final item = snapshot.data![index];
                              return TaskListTile(task: item);
                            } else {
                              return Text('Sin datos');
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(snapshot.hasData
                                ? '${snapshot.data!.length} items left'
                                : 'No items left'),
                            this.child ?? SizedBox(),
                            TextButton(
                              onPressed: () {},
                              child: Text('Clear completed'),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
