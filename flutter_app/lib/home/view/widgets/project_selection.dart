import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo_apps/home/view/widgets/project_radio_button.dart';

class ProjectSelection extends StatefulWidget {
  const ProjectSelection({
    required this.projectList,
    required this.onSelectProject,
    super.key,
  });

  final IList<String> projectList;
  final void Function(String) onSelectProject;

  @override
  State<ProjectSelection> createState() => _ProjectSelectionState();
}

class _ProjectSelectionState extends State<ProjectSelection> {
  String selectedProject = '';

  void selectProject(String project) {
    setState(() {
      selectedProject = project;
    });
    widget.onSelectProject(project);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final project in widget.projectList)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: ProjectRadioButton(
              project: project,
              isSelected: selectedProject == project,
              onTap: () => selectProject(project),
            ),
          ),
      ],
    );
  }
}
