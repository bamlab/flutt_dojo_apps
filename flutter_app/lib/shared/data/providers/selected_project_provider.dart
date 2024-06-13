import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_project_provider.g.dart';

@riverpod
class SelectedProject extends _$SelectedProject {
  @override
  String build() => '';

  set selectedProject(String selectedProject) {
    state = selectedProject;
  }
}
