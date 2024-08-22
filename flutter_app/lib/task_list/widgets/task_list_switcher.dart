import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo_apps/statistics/widgets/light_card.dart';

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
    const textStyle = TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );

    return LightCard(
      hasBorder: true,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: LayoutBuilder(
        builder: (context, constraints) => SizedBox(
          width: constraints.maxWidth,
          child: AnimatedToggleSwitch<TodoState>.size(
            current: selectedState,
            values: const [
              TodoState.done,
              TodoState.todo,
            ],
            selectedIconScale: 1,
            iconBuilder: (state) => state == TodoState.done
                ? const Text(
                    style: textStyle,
                    textAlign: TextAlign.center,
                    'To do',
                  )
                : const Text(
                    style: textStyle,
                    textAlign: TextAlign.center,
                    'Done',
                  ),
            indicatorSize: Size.fromWidth(constraints.maxWidth / 2),
            style: ToggleStyle(
              backgroundColor: Colors.transparent,
              borderColor: Colors.transparent,
              borderRadius: BorderRadius.circular(16),
              indicatorColor: const Color(0xFF241263),
            ),
            onChanged: (state) => onSelectedState({state}),
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
