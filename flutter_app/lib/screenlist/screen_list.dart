import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/cdapp_theme.dart';
import 'package:flutter_dojo_apps/home/view/home_view.dart';
import 'package:flutter_dojo_apps/statistics/view/statistics_view.dart';
import 'package:flutter_dojo_apps/task_list/view/task_list_view.dart';

class ScreenList extends StatelessWidget {
  const ScreenList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton.primary(
              label: 'Home',
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const HomeView(title: 'test'))),
            ),
            AppButton.secondary(
              label: 'Stat',
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const StatisticsView())),
            ),
            AppButton.tertiary(
              label: 'Task list',
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const TaskListView())),
            ),
          ],
        ),
      ),
    );
  }
}
