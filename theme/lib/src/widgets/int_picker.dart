import 'package:flutter_bam_theme/cdapp_theme.dart';
import 'package:flutter/material.dart';

class IntPicker extends StatefulWidget {
  const IntPicker({
    super.key,
    required this.initialValue,
    required this.onValueChanged,
  }) : assert(
          initialValue >= 0,
          'IntPicker does not handle negative initial value',
        );

  final int initialValue;
  final void Function(int newValue) onValueChanged;

  @override
  State<IntPicker> createState() => _IntPickerState();
}

class _IntPickerState extends State<IntPicker> {
  late int value = widget.initialValue;

  void increaseValue() {
    setState(() {
      value++;
    });
    widget.onValueChanged(value);
  }

  void decreaseValue() {
    if (value == 0) {
      return;
    }
    setState(() {
      value--;
    });
    widget.onValueChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final size = theme.sizes.xxxl;

    return AnimatedSwitcher(
      duration: theme.durations.xs,
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      child: value == 0
          ? _IntButton(
              buttonType: _IntButtonType.addition,
              borderRadiusType: _IntButtonBorderRadiusType.both,
              onTap: increaseValue,
              size: size,
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _IntButton(
                  buttonType: _IntButtonType.substraction,
                  borderRadiusType: _IntButtonBorderRadiusType.left,
                  onTap: decreaseValue,
                  size: size,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  height: size,
                  width: size,
                  child: Center(child: AppText.labelLarge(value.toString())),
                ),
                _IntButton(
                  buttonType: _IntButtonType.addition,
                  borderRadiusType: _IntButtonBorderRadiusType.right,
                  onTap: increaseValue,
                  size: size,
                ),
              ],
            ),
    );
  }
}

enum _IntButtonBorderRadiusType {
  left,
  right,
  both;

  T map<T>({required T left, required T right, required T both}) {
    switch (this) {
      case _IntButtonBorderRadiusType.left:
        return left;
      case _IntButtonBorderRadiusType.right:
        return right;
      case _IntButtonBorderRadiusType.both:
        return both;
    }
  }
}

enum _IntButtonType {
  substraction,
  addition;

  T map<T>({required T soustraction, required T addition}) {
    switch (this) {
      case _IntButtonType.substraction:
        return soustraction;
      case _IntButtonType.addition:
        return addition;
    }
  }
}

class _IntButton extends StatelessWidget {
  const _IntButton({
    required this.borderRadiusType,
    required this.onTap,
    required this.buttonType,
    required this.size,
  });

  final _IntButtonType buttonType;
  final _IntButtonBorderRadiusType borderRadiusType;
  final VoidCallback onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final borderRadius = theme.radius.asBorderRadius.xs;

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: borderRadiusType.map(
          left: borderRadius.leftOnly,
          right: borderRadius.rightOnly,
          both: borderRadius,
        ),
      ),
      height: size,
      width: size,
      child: AppTap(
        onTap: onTap,
        child: Icon(
          buttonType.map(
            soustraction: ThemeIcons.minus_regular,
            addition: Icons.add,
          ),
          color: theme.colorScheme.onPrimary,
        ),
      ),
    );
  }
}
