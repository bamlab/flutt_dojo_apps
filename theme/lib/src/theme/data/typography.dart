import 'package:flutter/material.dart';

import '../../utils/named.dart';
import 'colors.dart';

/// Data class that holds theme TextStyles.
/// See: [TextTheme]
class ThemeTypographyData extends TextTheme {
  /// Instantiate [TextTheme] with the flutter_bam_theme TextStyles and colors.
  ThemeTypographyData.fromColors(ThemeColorsData colors)
      : super(
          displayLarge: _poppinsBaseTextStyle.copyWith(
            fontSize: 57,
            height: 1.12,
            letterSpacing: 0,
            color: colors.text,
          ),
          displayMedium: _poppinsBaseTextStyle.copyWith(
            fontSize: 45,
            height: 1.15,
            letterSpacing: 0,
            color: colors.text,
          ),
          displaySmall: _poppinsBaseTextStyle.copyWith(
            fontSize: 36,
            height: 1.22,
            letterSpacing: 0,
            color: colors.text,
          ),
          headlineLarge: _poppinsBaseTextStyle.copyWith(
            fontSize: 32,
            height: 1.25,
            letterSpacing: 0,
            color: colors.text,
          ),
          headlineMedium: _poppinsBaseTextStyle.copyWith(
            fontSize: 28,
            height: 1.128,
            letterSpacing: 0,
            color: colors.text,
          ),
          headlineSmall: _poppinsBaseTextStyle.copyWith(
            fontSize: 24,
            height: 1.33,
            letterSpacing: 0,
            color: colors.text,
          ),
          titleLarge: _poppinsBaseTextStyle.copyWith(
            fontSize: 22,
            height: 1.27,
            letterSpacing: 0,
            color: colors.text,
            fontWeight: FontWeight.w700,
          ),
          titleMedium: _poppinsBaseTextStyle.copyWith(
            fontSize: 16,
            height: 1.5,
            letterSpacing: 0.15,
            color: colors.text,
            fontWeight: FontWeight.w700,
          ),
          titleSmall: _poppinsBaseTextStyle.copyWith(
            fontSize: 14,
            height: 1.43,
            letterSpacing: 0.1,
            color: colors.text,
            fontWeight: FontWeight.w700,
          ),
          labelLarge: _poppinsBaseTextStyle.copyWith(
            fontSize: 14,
            height: 1.43,
            letterSpacing: 0.1,
            color: colors.text,
            fontWeight: FontWeight.w700,
          ),
          labelMedium: _poppinsBaseTextStyle.copyWith(
            fontSize: 12,
            height: 1.33,
            letterSpacing: 0.5,
            color: colors.text,
            fontWeight: FontWeight.w700,
          ),
          labelSmall: _poppinsBaseTextStyle.copyWith(
            fontSize: 11,
            height: 1.45,
            letterSpacing: 0.5,
            color: colors.text,
            fontWeight: FontWeight.w700,
          ),
          bodyLarge: _poppinsBaseTextStyle.copyWith(
            fontSize: 16,
            height: 1.5,
            letterSpacing: 0.15,
            color: colors.text,
          ),
          bodyMedium: _poppinsBaseTextStyle.copyWith(
            fontSize: 14,
            height: 1.71,
            letterSpacing: 0.25,
            color: colors.text,
          ),
          bodySmall: _poppinsBaseTextStyle.copyWith(
            fontSize: 12,
            height: 1.33,
            letterSpacing: 0.4,
            color: colors.text,
          ),
        );
}

/// Extension on [TextTheme] that provide [TextStyle] getters matching BAM
/// design system.
///
/// This translates Material styles and BAM styles.
///
/// When starting a new project, modify those getters to match the project
/// design system.
///
/// Eg . `TextStyle get mediumTitle => titleLarge!.copyWith(fontSize: 26,
/// height: 30);`
extension CustomTextTheme on TextTheme {
  /// [TextStyle] getter pointing to [ThemeTypographyData.displayMedium]
  TextStyle get displayMedium => this.displayMedium!;

  /// [TextStyle] getter pointing to [ThemeTypographyData.headlineLarge]
  TextStyle get headlineLarge => this.headlineLarge!;

  /// [TextStyle] getter pointing to [ThemeTypographyData.headlineMedium]
  TextStyle get headlineMedium => this.headlineMedium!;

  /// [TextStyle] getter pointing to [ThemeTypographyData.headlineSmall]
  TextStyle get headlineSmall => this.headlineSmall!;

  /// [TextStyle] getter pointing to [ThemeTypographyData.titleLarge]
  TextStyle get titleLarge => this.titleLarge!;

  /// [TextStyle] getter pointing to [ThemeTypographyData.titleMedium]
  TextStyle get titleMedium => this.titleMedium!;

  /// [TextStyle] getter pointing to [ThemeTypographyData.titleSmall]
  TextStyle get titleSmall => this.titleSmall!;

  /// [TextStyle] getter pointing to [ThemeTypographyData.bodyLarge]
  TextStyle get bodyLarge => this.bodyLarge!;

  /// [TextStyle] getter pointing to [ThemeTypographyData.bodyMedium]
  TextStyle get bodyMedium => this.bodyMedium!;

  /// [TextStyle] getter pointing to [ThemeTypographyData.bodySmall]
  TextStyle get bodySmall => this.bodySmall!;

  /// [TextStyle] getter pointing to [ThemeTypographyData.labelLarge]
  TextStyle get labelLarge => this.labelLarge!;

  /// props getter to get every fields of this extension with their names
  ///
  /// It is useful in the test where you want to show which [TextStyle] is
  /// linked to one of this extension's field
  @visibleForTesting
  List<Named<TextStyle>> get namedProps => [
        displayMedium.named('displayMedium'),
        headlineLarge.named('headlineLarge'),
        headlineMedium.named('headlineMedium'),
        headlineSmall.named('headlineSmall'),
        titleLarge.named('titleLarge'),
        titleMedium.named('titleMedium'),
        titleSmall.named('titleSmall'),
        bodyLarge.named('bodyLarge'),
        bodyMedium.named('bodyMedium'),
        bodySmall.named('bodySmall'),
        labelLarge.named('labelLarge'),
      ];
}

const _poppinsBaseTextStyle = TextStyle(
  fontFamily: 'Poppins',
  package: 'flutter_bam_theme',
  fontWeight: FontWeight.normal,
);
