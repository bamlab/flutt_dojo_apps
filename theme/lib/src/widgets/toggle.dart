import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/cdapp_theme.dart';

enum AppToggleValue { first, second }

class AppToggle extends StatelessWidget {
  const AppToggle({
    required this.firstIcon,
    required this.secondIcon,
    required this.value,
    required this.onChanged,
    this.onToggleEnd,
    super.key,
  });

  final IconData firstIcon;
  final IconData secondIcon;
  final AppToggleValue value;
  final VoidCallback onChanged;
  final VoidCallback? onToggleEnd;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final iconSize = theme.sizes.xl;

    final animationDuration = theme.durations.xxs;

    return GestureDetector(
      onTap: () {
        onChanged();
        Future.delayed(animationDuration, onToggleEnd);
      },
      child: IntrinsicWidth(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: theme.colors.primary,
                borderRadius: BorderRadius.circular(theme.sizes.xxxl * 2),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: theme.sizes.xxs,
                  vertical: theme.sizes.xxs + theme.sizes.xxxs,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      firstIcon,
                      size: iconSize,
                      color: theme.colors.onPrimary,
                    ),
                    const AppGap.s(),
                    Icon(
                      secondIcon,
                      size: iconSize,
                      color: theme.colors.onPrimary,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: theme.sizes.asInsets.xxxs.horizontalOnly,
              child: AnimatedAlign(
                duration: animationDuration,
                curve: Curves.easeInOut,
                alignment: value == AppToggleValue.first
                    ? AlignmentDirectional.centerStart
                    : AlignmentDirectional.centerEnd,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.colors.onPrimary,
                  ),
                  child: Padding(
                    padding: theme.sizes.asInsets.xxs,
                    child: AnimatedCrossFade(
                      duration: animationDuration,
                      firstChild: Icon(
                        firstIcon,
                        size: iconSize,
                        color: theme.colors.primary,
                      ),
                      secondChild: Icon(
                        secondIcon,
                        size: iconSize,
                        color: theme.colors.primary,
                      ),
                      crossFadeState: value == AppToggleValue.first
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
