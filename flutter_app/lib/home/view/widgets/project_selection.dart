import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo_apps/home/view/widgets/project_radio_button.dart';
import 'package:flutter_dojo_apps/shared/data/providers/selected_project_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectSelection extends ConsumerWidget {
  const ProjectSelection({
    required this.projectList,
    super.key,
  });

  final IList<String> projectList;

  void selectProject(String project, WidgetRef ref) {
    ref.read(selectedProjectProvider.notifier).selectedProject = project;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedProject = ref.watch(selectedProjectProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final project in projectList)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: ProjectRadioButton(
              project: project,
              isSelected: selectedProject == project,
              onTap: () => selectProject(project, ref),
            ),
          ),
      ],
    );
  }
}
