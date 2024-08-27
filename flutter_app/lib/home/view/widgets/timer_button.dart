import 'package:flutter/material.dart';

class TimerButton extends StatelessWidget {
  const TimerButton({
    required this.onTap,
    required this.backgroundColor,
    required this.icon,
    this.padding,
    super.key,
  });

  final VoidCallback onTap;
  final Color backgroundColor;
  final Icon icon;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: padding ?? const EdgeInsets.all(36.5),
        backgroundColor: backgroundColor,
      ),
      child: icon,
    );
  }
}
