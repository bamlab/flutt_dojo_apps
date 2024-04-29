import 'package:flutter_bam_theme/cdapp_theme.dart';
import 'package:flutter/material.dart';

class RadioButton<T> extends StatefulWidget {
  const RadioButton({
    super.key,
    required this.description,
    required this.isSelected,
    required this.name,
    required this.item,
  });

  final String? name;
  final String? description;
  final bool isSelected;
  final T item;

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final onSurfaceColor = () {
      if (!widget.isSelected) {
        return theme.colors.grey200;
      }
      return theme.colors.colorsScheme.onSurface;
    }();

    final name = widget.name;
    final description = widget.description;

    return Padding(
      padding: theme.sizes.asInsets.m.copyWith(left: theme.sizes.m),
      child: Row(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _Dot(
                isSelected: widget.isSelected,
                onSurfaceColor: onSurfaceColor,
              ),
              const AppGap.xs(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (name != null)
                    AppText.bodyLarge(
                      name,
                    ),
                  if (description != null)
                    AppText.bodyMedium(
                      description,
                      color: theme.colors.primaryLight,
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    required this.isSelected,
    required this.onSurfaceColor,
  });

  final bool isSelected;
  final Color onSurfaceColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedContainer(
      duration: theme.durations.xs,
      height: isSelected ? theme.sizes.xl : theme.sizes.l,
      width: isSelected ? theme.sizes.xl : theme.sizes.l,
      decoration: BoxDecoration(
        border: Border.all(
          width: isSelected ? theme.sizes.xs : theme.sizes.xxxs,
          color: onSurfaceColor,
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
