import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/cdapp_theme.dart';
import 'package:flutter_dojo_apps/home/view/widgets/timer_button.dart';

class StartTimerButton extends StatelessWidget {
  const StartTimerButton({
    required this.onTap,
    super.key,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colors;
    return TimerButton(
      onTap: onTap,
      backgroundColor: colors.primary,
      icon: Icon(
        Icons.play_arrow_outlined,
        size: 80,
        color: colors.onPrimary,
      ),
    );
  }
}
