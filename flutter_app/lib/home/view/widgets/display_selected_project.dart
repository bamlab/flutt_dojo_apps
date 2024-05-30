import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/cdapp_theme.dart';

class DisplaySelectedProject extends StatelessWidget {
  const DisplaySelectedProject({
    required this.project,
    required this.onUnselectProject,
    super.key,
  });

  final String project;
  final VoidCallback onUnselectProject;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sizes = theme.sizes;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: sizes.l, vertical: sizes.s),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            project,
            style: theme.textTheme.labelLarge!
                .copyWith(color: theme.colors.primary),
          ),
          SizedBox(width: sizes.xs),
          InkWell(
            onTap: onUnselectProject,
            child: Icon(
              Icons.cancel_outlined,
              color: theme.colors.primary,
              size: sizes.xl,
            ),
          ),
        ],
      ),
    );
  }
}
