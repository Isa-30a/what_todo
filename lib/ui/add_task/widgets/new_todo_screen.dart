import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:what_todo/config/assets.dart';
import 'package:what_todo/config/settings/settings_controller.dart';
import 'package:what_todo/ui/add_task/widgets/new_todo_widget.dart';
import 'package:what_todo/ui/add_task/widgets/tasks_list_and_filter.dart';
import 'package:what_todo/ui/add_task/widgets/layout_home_screen.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key, required this.controller});
  static const routeName = '/';
  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   title: const Text('TODO'),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.settings),
      //       onPressed: () {
      //         // Navigate to the settings page. If the user leaves and returns
      //         // to the app after it has been killed while running in the
      //         // background, the navigation stack is restored.
      //         Navigator.restorablePushNamed(context, SettingsView.routeName);
      //       },
      //     ),
      //   ],
      // ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height / 2.7,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.bgDesktopDark),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: SingleChildScrollView(
              child: LayoutHomeScreen(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            'TODO',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .fontSize ??
                                  40,
                              letterSpacing: 10,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (controller.themeMode == ThemeMode.light) {
                              controller.updateThemeMode(ThemeMode.dark);
                            } else {
                              controller.updateThemeMode(ThemeMode.light);
                            }
                          },
                          icon: SvgPicture.asset(
                            controller.themeMode == ThemeMode.light
                                ? Assets.iconmoon
                                : Assets.iconsun,
                          ),
                        ),
                      ],
                    ),
                    // widget Crear nuevo task
                    NewTodoWidget(),

                    //lista de widgets

                    TasksListAndFilter(),

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
