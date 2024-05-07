import 'package:flutter/material.dart';

import '../../utils/named.dart';
import 'colors.dart';

/// Data class that holds theme TextStyles.
/// See: [TextTheme]
class ThemeTypographyData extends TextTheme {
  /// Instantiate [TextTheme] with the cdapp_theme TextStyles and colors.
  ThemeTypographyData.fromColors(ThemeColorsData colors)
      : super(
          displayLarge: _avenirBaseTextStyle.copyWith(
            fontSize: 60,
            height: 1.12,
            letterSpacing: 0,
            color: colors.text,
          ),
          displayMedium: _avenirBaseTextStyle.copyWith(
            fontSize: 46,
            height: 1.3,
            fontWeight: FontWeight.w800,
            letterSpacing: 0,
            color: colors.text,
          ),
          displaySmall: _avenirBaseTextStyle.copyWith(
            fontSize: 36,
            height: 1.22,
            letterSpacing: 0,
            color: colors.text,
          ),
          headlineLarge: _zillaSlabBaseTextStyle.copyWith(
            fontSize: 32,
            height: 1.25,
            letterSpacing: 0,
            color: colors.text,
          ),
          headlineMedium: _zillaSlabBaseTextStyle.copyWith(
            fontSize: 28,
            height: 1.128,
            letterSpacing: 0,
            color: colors.text,
          ),
          headlineSmall: _zillaSlabBaseTextStyle.copyWith(
            fontSize: 30,
            height: 1.3,
            letterSpacing: 0,
            fontWeight: FontWeight.w900,
            color: colors.text,
          ),
          titleLarge: _zillaSlabBaseTextStyle.copyWith(
            fontSize: 26,
            height: 1.2,
            letterSpacing: 0,
            color: colors.text,
            fontWeight: FontWeight.w700,
          ),
          titleMedium: _zillaSlabBaseTextStyle.copyWith(
            fontSize: 20,
            height: 1.3,
            letterSpacing: 0.15,
            color: colors.text,
            fontWeight: FontWeight.w800,
          ),
          titleSmall: _zillaSlabBaseTextStyle.copyWith(
            fontSize: 16,
            height: 1.3,
            letterSpacing: 0.1,
            color: colors.text,
            fontWeight: FontWeight.w800,
          ),
          bodyLarge: _avenirBaseTextStyle.copyWith(
            fontSize: 16,
            height: 1.5,
            letterSpacing: 0.15,
            color: colors.text,
          ),
          bodyMedium: _avenirBaseTextStyle.copyWith(
            fontSize: 16,
            height: 1.36,
            letterSpacing: 0.25,
            color: colors.text,
            fontWeight: FontWeight.w400,
          ),
          bodySmall: _avenirBaseTextStyle.copyWith(
            fontSize: 12,
            height: 1.33,
            letterSpacing: 0.4,
            color: colors.text,
          ),
          labelLarge: _avenirBaseTextStyle.copyWith(
            fontSize: 14,
            height: 1.43,
            letterSpacing: 0.1,
            color: colors.text,
            fontWeight: FontWeight.w700,
          ),
          labelMedium: _avenirBaseTextStyle.copyWith(
            fontSize: 12,
            height: 1.33,
            letterSpacing: 0.5,
            color: colors.text,
            fontWeight: FontWeight.w700,
          ),
          labelSmall: _avenirBaseTextStyle.copyWith(
            fontSize: 11,
            height: 1.45,
            letterSpacing: 0.5,
            color: colors.text,
            fontWeight: FontWeight.w700,
          ),
        );
}

/// Extension on [TextTheme] that provide [TextStyle] getters matching BAM
/// design system.
///
/// This translates Material styles and BAM styles.
///
/// When starting a new project, modify those getters to match
/// the project design system.
///
/// Eg . `TextStyle get mediumTitle => titleLarge!.copyWith(fontSize: 26,
/// height: 30);`
extension CustomTextTheme on TextTheme {
  TextStyle get displaySmall => this.displaySmall!;
  TextStyle get displayMedium => this.displayMedium!;
  TextStyle get displayLarge => this.displayLarge!;
  TextStyle get headlineLarge => this.headlineLarge!;
  TextStyle get headlineMedium => this.headlineMedium!;
  TextStyle get headlineSmall => this.headlineSmall!;
  TextStyle get titleLarge => this.titleLarge!;
  TextStyle get titleMedium => this.titleMedium!;
  TextStyle get titleSmall => this.titleSmall!;
  TextStyle get bodyLarge => this.bodyLarge!;
  TextStyle get bodyMedium => this.bodyMedium!;
  TextStyle get bodySmall => this.bodySmall!;
  TextStyle get labelLarge => this.labelLarge!;
  TextStyle get packTitle => _arcadienneBaseTextStyle.copyWith(
        fontSize: 48,
        height: 1,
        fontWeight: FontWeight.w600,
      );
  TextStyle get packTitleMedium => _arcadienneBaseTextStyle.copyWith(
        fontSize: 20,
        height: 1,
        fontWeight: FontWeight.w600,
      );
  TextStyle get titleMediumCaps => _montserratBlackBaseTextStyle.copyWith(
        fontSize: 20,
        height: 1.3,
        letterSpacing: 0.15,
        fontWeight: FontWeight.w900,
      );

  List<Named<TextStyle>> get props => [
        displaySmall.named('displaySmall'),
        displayMedium.named('displayMedium'),
        displayLarge.named('displayLarge'),
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
        packTitle.named('packTitle'),
        packTitleMedium.named('packTitleMedium'),
        titleMediumCaps.named('titleMediumCaps'),
      ];
}

const _montserratBaseTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  package: 'flutter_bam_theme',
  fontWeight: FontWeight.normal,
);

const _montserratBlackBaseTextStyle = TextStyle(
  fontFamily: 'Montserrat_Black',
  package: 'flutter_bam_theme',
  fontWeight: FontWeight.normal,
);

const _arcadienneBaseTextStyle = TextStyle(
  fontFamily: 'Arcadienne',
  package: 'flutter_bam_theme',
  fontWeight: FontWeight.w600,
);

const _avenirBaseTextStyle = TextStyle(
  fontFamily: 'Avenir',
  package: 'flutter_bam_theme',
  fontWeight: FontWeight.normal,
);

const _zillaSlabBaseTextStyle = TextStyle(
  fontFamily: 'ZillaSlab',
  package: 'flutter_bam_theme',
  fontWeight: FontWeight.normal,
);
