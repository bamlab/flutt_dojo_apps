import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/src/theme/extensions.dart';
import 'package:flutter_bam_theme/src/theme/themes_data.dart';
import 'package:flutter_bam_theme/src/widgets/icons.g.dart';
import 'package:flutter_bam_theme/src/widgets/tap.dart';
import 'package:flutter_bam_theme/src/widgets/text.dart';

class IntPicker extends StatefulWidget {
  const IntPicker({
    required this.initialValue,
    required this.onValueChanged,
    super.key,
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
  late int _value = widget.initialValue;

  void _increaseValue() {
    setState(() {
      _value += 1;
    });
    widget.onValueChanged(_value);
  }

  void _decreaseValue() {
    if (_value == 0) {
      return;
    }
    setState(() {
      _value -= 1;
    });
    widget.onValueChanged(_value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final size = theme.sizes.xxxl;

    return AnimatedSwitcher(
      duration: theme.durations.xs,
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      child: _value == 0
          ? _IntButton(
              buttonType: _IntButtonType.addition,
              borderRadiusType: _IntButtonBorderRadiusType.both,
              onTap: _increaseValue,
              size: size,
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _IntButton(
                  buttonType: _IntButtonType.substraction,
                  borderRadiusType: _IntButtonBorderRadiusType.left,
                  onTap: _decreaseValue,
                  size: size,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: theme.colorScheme.primary),
                  ),
                  height: size,
                  width: size,
                  child: Center(child: AppText.labelLarge(_value.toString())),
                ),
                _IntButton(
                  buttonType: _IntButtonType.addition,
                  borderRadiusType: _IntButtonBorderRadiusType.right,
                  onTap: _increaseValue,
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
    return switch (this) {
      _IntButtonBorderRadiusType.left => left,
      _IntButtonBorderRadiusType.right => right,
      _IntButtonBorderRadiusType.both => both,
    };
  }
}

enum _IntButtonType {
  substraction,
  addition;

  T map<T>({required T soustraction, required T addition}) {
    return switch (this) {
      _IntButtonType.substraction => soustraction,
      _IntButtonType.addition => addition,
    };
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
