import 'package:flutter/material.dart';

/// Enum of all styles
enum StyleEnum {
  /// style enum linked to [ThemeText.displayMedium] constructor and to
  /// [TextTheme.displayMedium]
  displayMedium,

  /// style enum linked to [ThemeText.headlineLarge] constructor and to
  /// [TextTheme.headlineLarge]
  headlineLarge,

  /// style enum linked to [ThemeText.headlineMedium] constructor and to
  /// [TextTheme.headlineMedium]
  headlineMedium,

  /// style enum linked to [ThemeText.headlineSmall] constructor and to
  /// [TextTheme.headlineSmall]
  headlineSmall,

  /// style enum linked to [ThemeText.titleLarge] constructor and to
  /// [TextTheme.titleLarge]
  titleLarge,

  /// style enum linked to [ThemeText.titleMedium] constructor and to
  /// [TextTheme.titleMedium]
  titleMedium,

  /// style enum linked to [ThemeText.titleSmall] constructor and to
  /// [TextTheme.titleSmall]
  titleSmall,

  /// style enum linked to [ThemeText.bodyLarge] constructor and to
  /// [TextTheme.bodyLarge]
  bodyLarge,

  /// style enum linked to [ThemeText.bodyMedium] constructor and to
  /// [TextTheme.bodyMedium]
  bodyMedium,

  /// style enum linked to [ThemeText.bodySmall] constructor and to
  /// [TextTheme.bodySmall]
  bodySmall,

  /// style enum linked to [ThemeText.labelLarge] constructor and to
  /// [TextTheme.labelLarge]
  labelLarge,
}

/// Texts in Theme
class ThemeText extends StatelessWidget {
  /// Display the displayMedium text
  const ThemeText.displayMedium(
    this.data, {
    super.key,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
  }) : enumStyle = StyleEnum.displayMedium;

  /// Display the headlineLarge text
  const ThemeText.headlineLarge(
    this.data, {
    super.key,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
  }) : enumStyle = StyleEnum.headlineLarge;

  /// Display the headlineMedium text
  const ThemeText.headlineMedium(
    this.data, {
    super.key,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
  }) : enumStyle = StyleEnum.headlineMedium;

  /// Display the headlineSmall text
  const ThemeText.headlineSmall(
    this.data, {
    super.key,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
  }) : enumStyle = StyleEnum.headlineSmall;

  /// Display the titleLarge text
  const ThemeText.titleLarge(
    this.data, {
    super.key,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
  }) : enumStyle = StyleEnum.titleLarge;

  /// Display the titleMedium text
  const ThemeText.titleMedium(
    this.data, {
    super.key,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
  }) : enumStyle = StyleEnum.titleMedium;

  /// Display the titleSmall text
  const ThemeText.titleSmall(
    this.data, {
    super.key,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
  }) : enumStyle = StyleEnum.titleSmall;

  /// Display the bodyLarge text
  const ThemeText.bodyLarge(
    this.data, {
    super.key,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
  }) : enumStyle = StyleEnum.bodyLarge;

  /// Display the bodyMedium text
  const ThemeText.bodyMedium(
    this.data, {
    super.key,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
  }) : enumStyle = StyleEnum.bodyMedium;

  /// Display the bodySmall text
  const ThemeText.bodySmall(
    this.data, {
    super.key,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
  }) : enumStyle = StyleEnum.bodySmall;

  /// Display the labelLarge text
  const ThemeText.labelLarge(
    this.data, {
    super.key,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
  }) : enumStyle = StyleEnum.labelLarge;

  /// The text to display.
  final String data;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// Whether the text should break at soft line breaks.
  final bool? softWrap;

  /// How visual overflow should be handled.
  final TextOverflow? overflow;

  /// The number of font pixels for each logical pixel.
  final double? textScaleFactor;

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

  /// Change style of the text
  final StyleEnum enumStyle;

  /// Returns the style corresponding to the given [enumStyle]
  ///
  /// The is useful to get the style in TextSpan for example
  static TextStyle? styleOf(BuildContext context, StyleEnum enumStyle) {
    final theme = Theme.of(context);
    switch (enumStyle) {
      case StyleEnum.displayMedium:
        return theme.textTheme.displayMedium;
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
      case StyleEnum.bodySmall:
        return theme.textTheme.bodySmall;
      case StyleEnum.labelLarge:
        return theme.textTheme.labelLarge;
    }
  }

  @override
  Widget build(BuildContext context) {
    final style = styleOf(context, enumStyle);
    return Text(
      data,
      textAlign: textAlign,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      style: style?.copyWith(
        color: color,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
      ),
    );
  }
}
