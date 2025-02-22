import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/cdapp_theme.dart';

/// Enum of all styles
enum StyleEnum {
  displayLarge,
  displaySmall,
  displayMedium,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodyMediumSemiBold,
  bodySmall,
  bodySmallSemiBold,
  labelLarge,
  packTitle,
  packTitleMedium,
  titleMediumCaps,
}

/// Texts in CDApp
class AppText extends StatelessWidget {
  /// Display the displaySmall text
  const AppText.displaySmall(
    this.data, {
    super.key,
    this.isSelectable = false,
    this.isUpperCase = false,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
    this.animationDuration,
  }) : enumStyle = StyleEnum.displaySmall;

  /// Display the displayMedium text
  const AppText.displayMedium(
    this.data, {
    super.key,
    this.isSelectable = false,
    this.isUpperCase = false,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
    this.animationDuration,
  }) : enumStyle = StyleEnum.displayMedium;

  /// Display the displayLarge text
  const AppText.displayLarge(
    this.data, {
    super.key,
    this.isSelectable = false,
    this.isUpperCase = false,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
    this.animationDuration,
  }) : enumStyle = StyleEnum.displayLarge;

  /// Display the headlineLarge text
  const AppText.headlineLarge(
    this.data, {
    super.key,
    this.isSelectable = false,
    this.isUpperCase = false,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
    this.animationDuration,
  }) : enumStyle = StyleEnum.headlineLarge;

  /// Display the headlineMedium text
  const AppText.headlineMedium(
    this.data, {
    super.key,
    this.isSelectable = false,
    this.isUpperCase = false,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
    this.animationDuration,
  }) : enumStyle = StyleEnum.headlineMedium;

  /// Display the headlineSmall text
  const AppText.headlineSmall(
    this.data, {
    super.key,
    this.isSelectable = false,
    this.isUpperCase = false,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
    this.animationDuration,
  }) : enumStyle = StyleEnum.headlineSmall;

  /// Display the titleLarge text
  const AppText.titleLarge(
    this.data, {
    super.key,
    this.isSelectable = false,
    this.isUpperCase = false,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
    this.animationDuration,
  }) : enumStyle = StyleEnum.titleLarge;

  /// Display the titleMedium text
  const AppText.titleMedium(
    this.data, {
    super.key,
    this.isSelectable = false,
    this.isUpperCase = false,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
    this.animationDuration,
  }) : enumStyle = StyleEnum.titleMedium;

  /// Display the titleSmall text
  const AppText.titleSmall(
    this.data, {
    super.key,
    this.isSelectable = false,
    this.isUpperCase = false,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
    this.animationDuration,
  }) : enumStyle = StyleEnum.titleSmall;

  /// Display the bodyLarge text
  const AppText.bodyLarge(
    this.data, {
    super.key,
    this.isSelectable = false,
    this.isUpperCase = false,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
    this.animationDuration,
  }) : enumStyle = StyleEnum.bodyLarge;

  /// Display the bodyMedium text
  const AppText.bodyMedium(
    this.data, {
    super.key,
    this.isSelectable = false,
    this.isUpperCase = false,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
    this.animationDuration,
  }) : enumStyle = StyleEnum.bodyMedium;

  /// Display the bodyMedium text
  const AppText.bodyMediumSemiBold(
    this.data, {
    super.key,
    this.isSelectable = false,
    this.isUpperCase = false,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
    this.animationDuration,
  }) : enumStyle = StyleEnum.bodyMediumSemiBold;

  /// Display the bodySmall text
  const AppText.bodySmall(
    this.data, {
    super.key,
    this.isSelectable = false,
    this.isUpperCase = false,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
    this.animationDuration,
  }) : enumStyle = StyleEnum.bodySmall;

  /// Display the bodySmallSemiBold text
  const AppText.bodySmallSemiBold(
    this.data, {
    super.key,
    this.isSelectable = false,
    this.isUpperCase = false,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
    this.animationDuration,
  }) : enumStyle = StyleEnum.bodySmallSemiBold;

  /// Display the labelLarge text
  const AppText.labelLarge(
    this.data, {
    super.key,
    this.isSelectable = false,
    this.isUpperCase = false,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
    this.animationDuration,
  }) : enumStyle = StyleEnum.labelLarge;

  /// Display the packTitle text
  const AppText.packTitle(
    this.data, {
    super.key,
    this.isSelectable = false,
    this.isUpperCase = false,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
    this.animationDuration,
  }) : enumStyle = StyleEnum.packTitle;

  /// Display the packTitleMedium text
  const AppText.packTitleMedium(
    this.data, {
    super.key,
    this.isSelectable = false,
    this.isUpperCase = false,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
    this.animationDuration,
  }) : enumStyle = StyleEnum.packTitleMedium;

  /// Display the titleMediumCaps text
  const AppText.titleMediumCaps(
    this.data, {
    super.key,
    this.isSelectable = false,
    this.isUpperCase = true,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
    this.animationDuration,
  }) : enumStyle = StyleEnum.titleMediumCaps;

  /// The text to display.
  final String data;

  /// Wether the text is selectable or not
  /// Default is false
  final bool isSelectable;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// Whether the text should break at soft line breaks.
  final bool? softWrap;

  /// How visual overflow should be handled.
  final TextOverflow? overflow;

  /// Describes how textual contents should be scaled for better readability.
  final TextScaler? textScaler;

  /// An optional maximum number of lines for the text to span, wrapping if
  /// necessary.
  /// If the text exceeds the given number of lines, it will be truncated
  /// according
  /// to [overflow].
  final int? maxLines;

  /// Change the color of the text
  final Color? color;

  /// Change the font weight of the text
  final FontWeight? fontWeight;

  /// Change the font style of the text
  final FontStyle? fontStyle;

  /// Change the text decoration of the text
  final TextDecoration? textDecoration;

  /// Change style of the text
  final StyleEnum enumStyle;

  /// The animation duration of the text color
  ///
  /// If null, the color change will be instant
  final Duration? animationDuration;

  /// Whether the text should be upper case or not
  final bool isUpperCase;

  /// Returns the style corresponding to the given [enumStyle]
  ///
  /// The is useful to get the style in TextSpan for example
  static TextStyle? styleOf(BuildContext context, StyleEnum enumStyle) {
    final theme = Theme.of(context);
    switch (enumStyle) {
      case StyleEnum.displaySmall:
        return theme.textTheme.displaySmall;
      case StyleEnum.displayMedium:
        return theme.textTheme.displayMedium;
      case StyleEnum.displayLarge:
        return theme.textTheme.displayLarge;
      case StyleEnum.headlineLarge:
        return theme.textTheme.headlineLarge;
      case StyleEnum.headlineMedium:
        return theme.textTheme.headlineMedium;
      case StyleEnum.headlineSmall:
        return theme.textTheme.headlineSmall;
      case StyleEnum.titleLarge:
        return theme.textTheme.titleLarge;
      case StyleEnum.titleMedium:
        return theme.textTheme.titleMedium;
      case StyleEnum.titleSmall:
        return theme.textTheme.titleSmall;
      case StyleEnum.bodyLarge:
        return theme.textTheme.bodyLarge;
      case StyleEnum.bodyMedium:
        return theme.textTheme.bodyMedium;
      case StyleEnum.bodyMediumSemiBold:
        return theme.textTheme.bodyMedium
            ?.copyWith(fontWeight: FontWeight.w600);
      case StyleEnum.bodySmall:
        return theme.textTheme.bodySmall;
      case StyleEnum.bodySmallSemiBold:
        return theme.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
        );
      case StyleEnum.labelLarge:
        return theme.textTheme.labelLarge;
      case StyleEnum.packTitle:
        return theme.textTheme.packTitle.copyWith(color: theme.colors.text);
      case StyleEnum.packTitleMedium:
        return theme.textTheme.packTitleMedium.copyWith(
          color: theme.colors.text,
        );
      case StyleEnum.titleMediumCaps:
        return theme.textTheme.titleMediumCaps.copyWith(
          color: theme.colors.text,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final animationDuration = this.animationDuration;
    final style = styleOf(context, enumStyle);

    final overflow = (this.overflow == null && maxLines != null)
        ? TextOverflow.ellipsis
        : this.overflow;

    final maybeUpperCasedData = isUpperCase ? data.toUpperCase() : data;

    return isSelectable
        ? SelectableText(
            maybeUpperCasedData,
            textAlign: textAlign,
            textScaler: textScaler,
            textHeightBehavior: const TextHeightBehavior(
              // This is for the text to be centered vertically even when an
              // height is set.
              leadingDistribution: TextLeadingDistribution.even,
            ),
            maxLines: maxLines,
            style: style!.copyWith(
              color: color,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: textDecoration,
              overflow: overflow,
            ),
          )
        : animationDuration != null
            ? AnimatedDefaultTextStyle(
                duration: animationDuration,
                style: style!.copyWith(
                  color: color,
                  fontWeight: fontWeight,
                  fontStyle: fontStyle,
                  decoration: textDecoration,
                ),
                child: Text(
                  maybeUpperCasedData,
                  textAlign: textAlign,
                  softWrap: softWrap,
                  overflow: overflow,
                  textScaler: textScaler,
                  textHeightBehavior: const TextHeightBehavior(
                    // This is for the text to be centered vertically even when
                    // an height is set.
                    leadingDistribution: TextLeadingDistribution.even,
                  ),
                  maxLines: maxLines,
                ),
              )
            : Text(
                maybeUpperCasedData,
                textAlign: textAlign,
                softWrap: softWrap,
                overflow: overflow,
                textScaler: textScaler,
                textHeightBehavior: const TextHeightBehavior(
                  // This is for the text to be centered vertically even when an
                  // height is set.
                  leadingDistribution: TextLeadingDistribution.even,
                ),
                maxLines: maxLines,
                style: style!.copyWith(
                  color: color,
                  fontWeight: fontWeight,
                  fontStyle: fontStyle,
                  decoration: textDecoration,
                ),
              );
  }
}
