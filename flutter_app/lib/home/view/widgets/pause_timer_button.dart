import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/cdapp_theme.dart';
import 'package:flutter_dojo_apps/home/view/widgets/timer_button.dart';

class PauseTimerButton extends StatelessWidget {
  const PauseTimerButton({
    required this.onTap,
    super.key,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colors;
    return TimerButton(
      onTap: onTap,
      backgroundColor: colors.secondary,
      icon: Icon(
        Icons.pause_outlined,
        size: 80,
        color: colors.primary,
      ),
    );
  }
}
