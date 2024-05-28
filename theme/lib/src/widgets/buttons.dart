import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bam_theme/cdapp_theme.dart';

enum ButtonType {
  primary,
  secondary,
  tertiary,
  danger,
  primaryLight,
  primaryCustomColor,
}

enum IconPosition { left, right }

const kButtonMinimumSize = Size(64, kMinInteractiveDimensionCupertino);
const kSmallButtonMinimumSize = Size(64, 32);

/// Button with the AppTheme
class AppButton extends StatelessWidget {
  const AppButton({
    required this.onPressed,
    required this.buttonType,
    super.key,
    this.icon,
    this.iconSize,
    this.iconLabelGap,
    this.iconColor,
    this.assetImage,
    this.buttonRadius,
    this.label,
    this.color,
    this.textDecoration,
    this.isLoading = false,
    this.iconPosition = IconPosition.left,
    this.isFullWidth = false,
    this.isSmall = false,
    this.alignment = MainAxisAlignment.center,
    this.backgroundColor,
  }) : assert(
          !(icon != null && assetImage != null),
          'You should only give an icon or an image',
        );

  const AppButton.primary({
    required this.onPressed,
    super.key,
    this.icon,
    this.iconSize,
    this.iconLabelGap,
    this.iconColor,
    this.assetImage,
    this.buttonRadius,
    this.label,
    this.color,
    this.textDecoration,
    this.isLoading = false,
    this.iconPosition = IconPosition.left,
    this.isFullWidth = false,
    this.isSmall = false,
    this.alignment = MainAxisAlignment.center,
  })  : buttonType = ButtonType.primary,
        backgroundColor = null,
        assert(
          !(icon != null && assetImage != null),
          'You should only give an icon or an image',
        );

  const AppButton.primaryCustomColor({
    required this.onPressed,
    super.key,
    this.icon,
    this.iconSize,
    this.iconLabelGap,
    this.iconColor,
    this.assetImage,
    this.buttonRadius,
    this.label,
    this.color,
    this.textDecoration,
    this.isLoading = false,
    this.iconPosition = IconPosition.left,
    this.isFullWidth = false,
    this.isSmall = false,
    this.alignment = MainAxisAlignment.center,
    this.backgroundColor,
  })  : buttonType = ButtonType.primaryCustomColor,
        assert(
          !(icon != null && assetImage != null),
          'You should only give an icon or an image',
        );

  const AppButton.secondary({
    required this.onPressed,
    super.key,
    this.icon,
    this.iconSize,
    this.iconLabelGap,
    this.iconColor,
    this.assetImage,
    this.buttonRadius,
    this.label,
    this.color,
    this.textDecoration,
    this.isLoading = false,
    this.iconPosition = IconPosition.left,
    this.isFullWidth = false,
    this.isSmall = false,
    this.alignment = MainAxisAlignment.center,
  })  : buttonType = ButtonType.secondary,
        backgroundColor = null,
        assert(
          !(icon != null && assetImage != null),
          'You should only give an icon or an image',
        );

  const AppButton.tertiary({
    required this.onPressed,
    super.key,
    this.icon,
    this.iconSize,
    this.iconLabelGap,
    this.iconColor,
    this.color,
    this.textDecoration,
    this.assetImage,
    this.buttonRadius,
    this.label,
    this.isLoading = false,
    this.iconPosition = IconPosition.left,
    this.isFullWidth = false,
    this.isSmall = false,
    this.alignment = MainAxisAlignment.center,
  })  : buttonType = ButtonType.tertiary,
        backgroundColor = null,
        assert(
          !(icon != null && assetImage != null),
          'You should only give an icon or an image',
        );

  const AppButton.danger({
    required this.onPressed,
    super.key,
    this.icon,
    this.iconSize,
    this.iconLabelGap,
    this.iconColor,
    this.assetImage,
    this.buttonRadius,
    this.label,
    this.color,
    this.textDecoration,
    this.isLoading = false,
    this.iconPosition = IconPosition.left,
    this.isFullWidth = false,
    this.isSmall = false,
    this.alignment = MainAxisAlignment.center,
  })  : buttonType = ButtonType.danger,
        backgroundColor = null,
        assert(
          !(icon != null && assetImage != null),
          'You should only give an icon or an image',
        );

  const AppButton.primaryLight({
    required this.onPressed,
    super.key,
    this.icon,
    this.iconSize,
    this.iconLabelGap,
    this.iconColor,
    this.assetImage,
    this.buttonRadius,
    this.label,
    this.color,
    this.textDecoration,
    this.isLoading = false,
    this.iconPosition = IconPosition.left,
    this.isFullWidth = false,
    this.isSmall = false,
    this.alignment = MainAxisAlignment.center,
  })  : buttonType = ButtonType.primaryLight,
        backgroundColor = null,
        assert(
          !(icon != null && assetImage != null),
          'You should only give an icon or an image',
        );

  final IconData? icon;

  final double? iconSize;

  final BorderRadius? buttonRadius;

  /// The space between the icon and the label.
  ///
  /// If null, [AppGap.xs] will be used.
  final AppGap? iconLabelGap;
  final AssetImage? assetImage;
  final String? label;
  final void Function()? onPressed;
  final ButtonType buttonType;
  final bool isLoading;
  final IconPosition iconPosition;
  final bool isFullWidth;
  final bool isSmall;
  final Color? color;
  final Color? iconColor;
  final TextDecoration? textDecoration;
  final Color? backgroundColor;

  /// The alignment of the [icon] and [label] within the button if button is
  /// in full width mode.
  ///
  /// Defaults to [MainAxisAlignment.center].
  final MainAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    final label = this.label;
    final isDisabled = onPressed == null || isLoading;
    final onButtonPress = isDisabled ? null : onPressed;
    final iconLabelGap = this.iconLabelGap;
    final maybeIconColor = iconColor;

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

    final theme = Theme.of(context);

    final padding = EdgeInsets.symmetric(
      vertical: isSmall ? 0 : theme.sizes.s,
      horizontal: isSmall ? theme.sizes.m : theme.sizes.xl,
    );

    final backgroundColor = () {
      switch (buttonType) {
        case ButtonType.primary:
          return theme.colors.primary;
        case ButtonType.primaryCustomColor:
          return this.backgroundColor ?? theme.colors.primary;
        case ButtonType.secondary:
          return theme.colors.background;
        case ButtonType.tertiary:
        case ButtonType.danger:
          return theme.colors.transparent;
        case ButtonType.primaryLight:
          return theme.colors.onPrimary;
      }
    }();

    final disabledBackgroundColor = () {
      switch (buttonType) {
        case ButtonType.primaryCustomColor:
          if (isLoading) {
            return backgroundColor;
          }
          return theme.colors.grey50;
        case ButtonType.primary:
          if (isLoading) {
            return theme.colors.primaryLight;
          }
          return theme.colors.grey50;
        case ButtonType.primaryLight:
          return theme.colors.grey50;
        case ButtonType.secondary:
          if (isLoading) {
            return theme.colors.transparent;
          }
          return theme.colors.grey50;
        case ButtonType.tertiary:
        case ButtonType.danger:
          return theme.colors.transparent;
      }
    }();

    final foregroundColor = () {
      switch (buttonType) {
        case ButtonType.primary:
        case ButtonType.primaryCustomColor:
          return theme.colors.onPrimary;
        case ButtonType.secondary:
        case ButtonType.tertiary:
          return color ?? theme.colors.primary;
        case ButtonType.danger:
          return theme.colors.onError;
        case ButtonType.primaryLight:
          return theme.colors.primary;
      }
    }();

    final disabledForegroundColor = () {
      switch (buttonType) {
        case ButtonType.primary:
        case ButtonType.primaryCustomColor:
          return theme.colors.grey300;
        case ButtonType.secondary:
          if (isLoading) {
            return theme.colors.primary;
          }
          return theme.colors.grey300;
        case ButtonType.tertiary:
          return theme.colors.grey300;
        case ButtonType.danger:
          return theme.colors.onError;
        case ButtonType.primaryLight:
          return theme.colors.grey300;
      }
    }();

    final buttonRadius = this.buttonRadius ?? theme.radius.asBorderRadius.xs;

    final style = () {
      switch (buttonType) {
        case ButtonType.primary:
        case ButtonType.primaryCustomColor:
          return ElevatedButton.styleFrom(
            minimumSize: isSmall ? kSmallButtonMinimumSize : kButtonMinimumSize,
            backgroundColor: backgroundColor,
            elevation: 0,
            disabledBackgroundColor: disabledBackgroundColor,
            padding: padding,
            shape: RoundedRectangleBorder(
              borderRadius: buttonRadius,
            ),
          );
        case ButtonType.primaryLight:
          return ElevatedButton.styleFrom(
            minimumSize: isSmall ? kSmallButtonMinimumSize : kButtonMinimumSize,
            backgroundColor: backgroundColor,
            elevation: 0,
            disabledBackgroundColor: disabledBackgroundColor,
            padding: padding,
            shape: RoundedRectangleBorder(
              borderRadius: buttonRadius,
            ),
          );
        case ButtonType.secondary:
          return OutlinedButton.styleFrom(
            minimumSize: isSmall ? kSmallButtonMinimumSize : kButtonMinimumSize,
            backgroundColor: backgroundColor,
            disabledBackgroundColor: disabledBackgroundColor,
            foregroundColor: theme.colors.secondary,
            elevation: 0,
            padding: padding,
            side: BorderSide(
              color: isDisabled ? disabledForegroundColor : foregroundColor,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: buttonRadius,
            ),
          );
        case ButtonType.danger:
        case ButtonType.tertiary:
          return TextButton.styleFrom(
            minimumSize: isSmall ? kSmallButtonMinimumSize : kButtonMinimumSize,
            backgroundColor: backgroundColor,
            disabledForegroundColor: disabledForegroundColor,
            elevation: 0,
            padding: padding,
            shape: RoundedRectangleBorder(
              borderRadius: buttonRadius,
            ),
          );
      }
    }();

    final buttonSymbol = () {
      if (icon != null) {
        return Icon(
          icon,
          size: iconSize ?? theme.iconTheme.size,
          color: maybeIconColor ??
              (isDisabled ? disabledForegroundColor : foregroundColor),
        );
      } else if (assetImage != null) {
        return Opacity(
          opacity: isDisabled ? 0.5 : 1,
          child: Image(
            image: assetImage!,
            height: theme.iconTheme.size,
            width: theme.iconTheme.size,
          ),
        );
      }
      return null;
    }();

    final buttonChild = () {
      // _ConditionalFittedBox has to be above _FullWidthWrapper
      // to make 'resizeTextOneLine' work when 'isFullWidth' is true

      const fontWeight = FontWeight.w600;

      final textColor = isDisabled ? disabledForegroundColor : foregroundColor;

      final finalTextDecoration = buttonType == ButtonType.tertiary
          ? textDecoration ?? TextDecoration.underline
          : null;

      return _FullWidthWrapper(
        isFullWidth: isFullWidth,
        alignment: alignment,
        child: Stack(
          // We use a Stack with an Opacity widgets
          // to avoid button to shrink when loading
          alignment: Alignment.center,
          children: [
            if (isLoading) AppLoader.regular(color: foregroundColor),
            Opacity(
              opacity: isLoading ? 0 : 1,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: alignment,
                children: <Widget>[
                  if (buttonSymbol != null) buttonSymbol,
                  if (buttonSymbol != null && label != null)
                    iconLabelGap ?? const AppGap.xs(),
                  if (label != null)
                    Flexible(
                      // Using a FittedBox to avoid the label to be shrinked
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: AppText.labelLarge(
                          label,
                          maxLines: 1,
                          fontWeight: fontWeight,
                          color: textColor,
                          textDecoration: finalTextDecoration,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      );
    }();

    return Directionality(
      textDirection: direction,
      child: () {
        switch (buttonType) {
          case ButtonType.primaryLight:
          case ButtonType.primary:
          case ButtonType.primaryCustomColor:
            return ElevatedButton(
              style: style,
              onPressed: onButtonPress,
              child: buttonChild,
            );

          case ButtonType.secondary:
            return OutlinedButton(
              style: style,
              onPressed: onButtonPress,
              child: buttonChild,
            );

          case ButtonType.danger:
          case ButtonType.tertiary:
            return TextButton(
              style: style,
              onPressed: onButtonPress,
              child: buttonChild,
            );
        }
      }(),
    );
  }
}

class _FullWidthWrapper extends StatelessWidget {
  const _FullWidthWrapper({
    required this.child,
    required this.isFullWidth,
    required this.alignment,
  });

  final Widget child;
  final bool isFullWidth;
  final MainAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    if (isFullWidth) {
      // return child;
      return Row(
        mainAxisAlignment: alignment,
        children: [
          if (alignment == MainAxisAlignment.start) const AppGap.m(),
          Flexible(
            child: child,
          ),
        ],
      );
    }
    return child;
  }
}
