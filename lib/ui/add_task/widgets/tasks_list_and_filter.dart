import 'package:flutter/material.dart';
import 'package:what_todo/ui/add_task/widgets/tasks_list_view.dart';

class TasksListAndFilter extends StatefulWidget {
  const TasksListAndFilter({super.key});

  @override
  State<TasksListAndFilter> createState() => _TasksListAndFilterState();
}

class _TasksListAndFilterState extends State<TasksListAndFilter>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Widget filterTab = Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     TextButton(onPressed: () {}, child: Text('All')),
    //     TextButton(onPressed: () {}, child: Text('Active')),
    //     TextButton(onPressed: () {}, child: Text('Completed'))
    //   ],
    // );

    Widget tab = Center(
      child: TabBar(
        controller: _tabController,
        tabs: [
          Tab(text: 'All'),
          Tab(text: 'Active'),
          Tab(text: 'Completed'),
        ],
        tabAlignment: TabAlignment.center,
        labelColor: Colors.blue,
        unselectedLabelColor: Colors.grey,
        indicator: BoxDecoration(),
        dividerColor: Colors.transparent,
      ),
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
                child: TasksListView(child: maxWidth >= 600 ? tab : null),
              ),
            ),
            if (maxWidth < 600) Card(child: tab),
          ],
        );
      },
    );
  }
}
