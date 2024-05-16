import 'package:flutter/material.dart';
import 'package:flutter_dojo_apps/task_list/widgets/company_logo.dart';

class TaskListHeader extends StatelessWidget {
  const TaskListHeader({super.key, required this.projects});

  final List<AssetImage> projects;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return CompanyLogo(imageProvider: projects[index]);
        },
      ),
    );
  }
}
