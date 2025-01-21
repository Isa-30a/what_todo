import 'package:flutter/material.dart';
import 'package:what_todo/config/assets.dart';
import 'package:what_todo/config/settings/settings_view.dart';
import 'package:what_todo/data/repositories/task_repository.dart';
import 'package:what_todo/data/services/task_service.dart';
import 'package:what_todo/ui/add_task/widgets/new_todo_widget.dart';
import 'package:what_todo/ui/add_task/widgets/tasks_list_view.dart';
import 'package:what_todo/ui/add_task/view_model/new_todo_vm.dart';
import 'package:what_todo/ui/add_task/widgets/layout_home_screen.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key});
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final viewModel = NewTodoVm(
      taskRepository: TaskRepository(taskService: TaskService()),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('TODO'),
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
      body: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height / 4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.bgDesktopDark),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: LayoutHomeScreen(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // widget Crear nuevo task
                    NewTodoWidget(),

                    //lista de widgets

                    Container(
                      color: Colors.transparent,
                      height: MediaQuery.sizeOf(context).height / 2,
                      child: TasksListView(),
                    ),
                    //filterWidgets

                    Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(onPressed: () {}, child: Text('All')),
                          TextButton(onPressed: () {}, child: Text('Active')),
                          TextButton(onPressed: () {}, child: Text('Completed'))
                        ],
                      ),
                    ),
                    //coment Drag and drop1
                    Text(
                      'Drag and drop to reorder list',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}