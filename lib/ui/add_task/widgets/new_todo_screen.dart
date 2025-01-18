import 'package:flutter/material.dart';
import 'package:what_todo/config/settings/settings_view.dart';
import 'package:what_todo/src/sample_feature/tasks_list_view.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key});
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Items'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              // widget Crear nuevo task
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: ListTile(
                  leading: IconButton.outlined(
                      onPressed: () {}, icon: Icon(Icons.abc)),
                  title: Text('Create a new todo...'),
                ),
              ),

              //lista de widgets
              Container(
                color: Colors.red,
                height: MediaQuery.sizeOf(context).height / 3,
                child: TasksListView(),
              )
              //filterWidgets
              ,
              //coment Drag and drop
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(onPressed: () {}, child: Text('All')),
                  TextButton(onPressed: () {}, child: Text('Active')),
                  TextButton(onPressed: () {}, child: Text('Completed'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
