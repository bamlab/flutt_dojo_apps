import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo_apps/home/view/widgets/project_selection_bottom_sheet.dart';

Future<void> showProjectSelectionBottomSheet({
  required BuildContext context,
  required IList<String> projectList,
}) async {
  await showModalBottomSheet<void>(
    context: context,
    builder: (context) {
      return ProjectSelectionBottomSheet(projectList: projectList);
    },
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    clipBehavior: Clip.hardEdge,
  );
}
