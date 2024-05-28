import 'package:flutter/material.dart';

import 'package:flutter_bam_theme/cdapp_theme.dart';

class AppCheckbox extends StatelessWidget {
  const AppCheckbox({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final bool value;
  final void Function({required bool value}) onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox.square(
      dimension: theme.sizes.xl,
      child: Checkbox(
        activeColor: theme.colors.primary,
        fillColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return theme.colors.primary;
            }
            return theme.colors.onPrimary;
          },
        ),
        value: value,
        // [value] is actually never null because it can only be if the checkbox
        // is disabled, which we never allow.
        onChanged: (value) => onChanged(value: value ?? false),
      ),
    );
  }
}
