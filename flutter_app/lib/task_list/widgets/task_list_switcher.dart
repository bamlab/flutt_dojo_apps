import 'package:flutter/material.dart';

class TaskListSwitcher extends StatelessWidget {
  const TaskListSwitcher({
    required this.selectedState,
    required this.onSelectedState,
    super.key,
  });

  final TodoState selectedState;
  final void Function(Set<TodoState>) onSelectedState;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromARGB(20, 255, 255, 255),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: SegmentedButton<TodoState>(
        segments: const [
          ButtonSegment(
            value: TodoState.done,
            label: Text(
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
              'Done',
            ),
          ),
          ButtonSegment(
            value: TodoState.todo,
            label: Text(
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
              'To Do',
            ),
          ),
        ],
        selected: {selectedState},
        showSelectedIcon: false,
        onSelectionChanged: onSelectedState,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith(
            // ignore: prefer-switch-with-enums , not in a contain
            (states) => states.contains(WidgetState.selected)
                ? const Color(0xFF241263)
                : Colors.transparent,
          ),
          side: const WidgetStatePropertyAll(
            BorderSide(color: Color.fromARGB(40, 255, 255, 255)),
          ),
          shape: const WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
          ),
        ),
      ),
    );
  }
}

enum TodoState {
  done,
  todo,
}
