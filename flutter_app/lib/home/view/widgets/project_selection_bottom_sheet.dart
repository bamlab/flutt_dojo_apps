import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo_apps/home/view/widgets/project_selection.dart';

class ProjectSelectionBottomSheet extends StatelessWidget {
  const ProjectSelectionBottomSheet({
    required this.projectList,
    required this.onSelectedProject,
    super.key,
  });

  final IList<String> projectList;
  final void Function(String) onSelectedProject;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Sélectionner un projet',
                style: TextStyle(
                  color: Color(0xFF241263),
                  fontFamily: 'ZillaSlab',
                  fontWeight: FontWeight.w700,
                  fontSize: 26,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ProjectSelection(
                projectList: projectList,
                onSelectProject: onSelectedProject,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
