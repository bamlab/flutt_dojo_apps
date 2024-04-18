import 'package:flutter/material.dart';

class TaskListSwitcher extends StatelessWidget {
  const TaskListSwitcher(
      {super.key, required this.selectedState, required this.onSelectedState});

  final TodoState selectedState;
  final void Function(Set<TodoState>) onSelectedState;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<TodoState>(
      segments: const [
        ButtonSegment(
            value: TodoState.done,
            label: Text(textAlign: TextAlign.center, 'Done')),
        ButtonSegment(
            value: TodoState.todo,
            label: Text(textAlign: TextAlign.center, 'To Do'))
      ],
      selected: {selectedState},
      onSelectionChanged: onSelectedState,
    );
  }
}

enum TodoState {
  done,
  todo,
}
