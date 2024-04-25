import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';

import '../../flutter_bam_theme.dart';

/// buttonType used to get the correct style for the button
enum _ButtonType {
  /// Elevated button type matching [ElevatedButton] style
  elevated,

  /// Outlined button type matching [OutlinedButton] style
  outlined,

  /// Text button type matching [TextButton] style
  text,
}

/// Position of the icon in the button enum
enum IconPosition {
  /// left to the button label if there is one
  left,

  /// right to the button label if there is one
  right
}

/// Button with the Theme
class ThemeButton extends StatelessWidget {
  /// Button primary constructor
  const ThemeButton.primary({
    super.key,
    this.label,
    this.icon,
    this.iconPosition = IconPosition.left,
    this.onPressed,
    this.isLoading = false,
    this.isFullWidth = false,
  }) : _buttonType = _ButtonType.elevated;

  /// Button secondary constructor
  const ThemeButton.secondary({
    super.key,
    this.label,
    this.icon,
    this.iconPosition = IconPosition.left,
    this.onPressed,
    this.isLoading = false,
    this.isFullWidth = false,
  }) : _buttonType = _ButtonType.outlined;

  /// Button tertiary constructor
  const ThemeButton.tertiary({
    super.key,
    this.label,
    this.icon,
    this.iconPosition = IconPosition.left,
    this.onPressed,
    this.isLoading = false,
    this.isFullWidth = false,
  }) : _buttonType = _ButtonType.text;

  /// Label given to the button
  final String? label;

  /// Icon given to the button
  final IconData? icon;

  /// IconPosition used if there is a label and an icon
  ///
  /// Default to left
  final IconPosition iconPosition;

  /// Button onPressed callback
  ///
  /// Should be null to disabke the button
  final void Function()? onPressed;

  /// Whether the button is in loading state
  final bool isLoading;

  /// Whether the button takes the full width available
  final bool isFullWidth;

  /// The [_ButtonType] of the button allowing to choose the style of the button
  final _ButtonType _buttonType;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final label = this.label;
    final isDisabled = onPressed == null || isLoading;
    final onButtonPress = isDisabled ? null : onPressed;

    // Currently we use TextDirection and Directionality to place the icon
    // There is no proper prop to use to do it
    // There is an open issue on the Flutter repo to do it : https://github.com/flutter/flutter/issues/71941
    final direction = () {
      if (label == null || icon == null) {
        return TextDirection.ltr;
      }
      if (iconPosition == IconPosition.left) {
        return TextDirection.ltr;
      }
      return TextDirection.rtl;
    }();

    ButtonStyle? getButtonStyle(BuildContext context) {
      ButtonStyle? buttonStyle;

      switch (_buttonType) {
        case _ButtonType.elevated:
          buttonStyle = ElevatedButtonTheme.of(context).style;
        case _ButtonType.outlined:
          buttonStyle = OutlinedButtonTheme.of(context).style;
        case _ButtonType.text:
          buttonStyle = TextButtonTheme.of(context).style;
      }

      return buttonStyle?.copyWith(
        side: MaterialStateProperty.resolveWith((state) {
          final iState = state.toISet();

          if (isLoading && isDisabled) {
            // We don't want the loading button to look disabled even though
            // it is
            return buttonStyle?.side
                ?.resolve(iState.remove(MaterialState.disabled).toSet());
          }

          return buttonStyle?.side?.resolve(iState.toSet());
        }),
        foregroundColor: MaterialStateProperty.resolveWith((state) {
          final iState = state.toISet();

          if (isLoading && isDisabled) {
            // We don't want the loading button to look disabled even though
            // it is
            return buttonStyle?.foregroundColor
                ?.resolve(iState.remove(MaterialState.disabled).toSet());
          }

          return buttonStyle?.foregroundColor?.resolve(iState.toSet());
        }),
        backgroundColor: MaterialStateProperty.resolveWith((state) {
          final iState = state.toISet();

          if (isLoading && isDisabled) {
            // We don't want the loading button to look disabled even though
            // it is
            return buttonStyle?.backgroundColor
                ?.resolve(iState.remove(MaterialState.disabled).toSet());
          }

          return buttonStyle?.backgroundColor?.resolve(iState.toSet());
        }),
      );
    }

    Color? getButtonForegroundColor(BuildContext context) {
      return getButtonStyle(context)
          ?.foregroundColor
          ?.resolve(isDisabled ? {MaterialState.disabled} : {});
    }

    final buttonSymbol = () {
      if (icon != null) {
        return Builder(
          builder: (context) {
            return Icon(
              icon,
              color: getButtonForegroundColor(context),
            );
          },
        );
      }
      return null;
    }();

    final buttonChild = () {
      return _FullWidthWrapper(
        isFullWidth: isFullWidth,
        child: Stack(
          // We use a Stack with an Opacity widgets
          // to avoid button to shrink when loading
          alignment: Alignment.center,
          children: [
            if (isLoading)
              Builder(
                builder: (context) {
                  return ThemeLoader(
                    color: getButtonForegroundColor(context),
                  );
                },
              ),
            Opacity(
              opacity: isLoading ? 0 : 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (buttonSymbol != null) buttonSymbol,
                  if (buttonSymbol != null && label != null)
                    SizedBox(width: theme.sizes.s),
                  if (label != null) Flexible(child: Text(label, maxLines: 1)),
                ],
              ),
            ),
          ],
        ),
      );
    }();

    return Builder(
      builder: (context) {
        return Directionality(
          textDirection: direction,
          child: () {
            final buttonStyle = getButtonStyle(context);

            switch (_buttonType) {
              case _ButtonType.elevated:
                return ElevatedButton(
                  onPressed: onButtonPress,
                  style: buttonStyle,
                  child: buttonChild,
                );

              case _ButtonType.outlined:
                return OutlinedButton(
                  onPressed: onButtonPress,
                  style: buttonStyle,
                  child: buttonChild,
                );

              case _ButtonType.text:
                return TextButton(
                  onPressed: onButtonPress,
                  style: buttonStyle,
                  child: buttonChild,
                );
            }
          }(),
        );
      },
    );
  }
}

class _FullWidthWrapper extends StatelessWidget {
  const _FullWidthWrapper({
    required this.child,
    required this.isFullWidth,
  });

  final Widget child;
  final bool isFullWidth;

  @override
  Widget build(BuildContext context) {
    if (isFullWidth) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: child,
          ),
        ],
      );
    }
    return child;
  }
}
