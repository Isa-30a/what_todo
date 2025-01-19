import 'package:flutter/material.dart';
import 'package:what_todo/config/assets.dart';
import 'package:what_todo/config/settings/settings_view.dart';
import 'package:what_todo/src/sample_feature/tasks_list_view.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key});
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // widget Crear nuevo task
                Card(
                  child: ListTile(
                    leading: TextButton(
                      onPressed: () {},
                      child: Icon(Icons.circle_outlined),
                    ),
                    title: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Create a new todo...',
                      ),
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      controller: controller,
                      onSubmitted: (String value) {},
                    ),
                  ),
                ),

                //lista de widgets

                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 3,
                  child: TasksListView(),
                ),
                //filterWidgets

                //coment Drag and drop

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
                Text('Drag and drop to reorder list')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
