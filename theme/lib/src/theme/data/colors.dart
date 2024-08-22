import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bam_theme/src/utils/named.dart';

// Colors are named with this website:
// https://colornamer.robertcooper.me
const _white = Colors.white;
const _transparent = Colors.transparent;
const _violetDojo = Color(0xFF241263);
const _violetDojoLight = Color(0xFF623CEA);
const _orangeDojo = Color(0xFFFFBA9D);
const _salonBleu = Color(0xFF7D8896);
const _silverSprings = Color(0xFFB5BCC3);
const _grainOfSalt = Color(0xFFD8DCE0);
const _gramsHair = Color(0xFFF6F6F8);

// Colors are named with this website:
// https://colornamer.robertcooper.me
const _whiteSmoke = Color(0xFFF5F5F5);
const _blackMetal = Color(0xFF050505);
const _blackIsBack = Color(0xFF0D131E);
const _skyCaptain = Color(0xFF252B34);
const _cruelRuby = Color(0xFFE12E40);
const _yuzuMarmalade = Color(0xFFFFD764);
const _benzolGreen = Color(0xFF00D967);
const _blackBeauty = Color(0xFF25282A);
const _canonBlue = Color(0xFFA2E5FB);
const _grey = Colors.grey;

/// Data class that holds every theme colors.
class ThemeColorsData extends Equatable {
  /// default constructor.
  const ThemeColorsData({
    required this.brightness,
    required this.primary,
    required this.primaryLight,
    required this.grey50,
    required this.grey100,
    required this.grey200,
    required this.grey300,
    required this.onPrimary,
    required this.background,
    required this.onBackground,
    required this.error,
    required this.onError,
    required this.statusWarning,
    required this.statusSuccess,
    required this.secondary,
    required this.onSecondary,
    required this.surface,
    required this.onSurface,
    required this.disable,
  }) : transparent = _transparent;

  /// Instantiate ThemeColorsData with [ThemeMode.light] data.
  const ThemeColorsData.light()
      : brightness = Brightness.light,
        primary = _violetDojo,
        primaryLight = _violetDojoLight,
        grey300 = _salonBleu,
        grey200 = _silverSprings,
        grey100 = _grainOfSalt,
        grey50 = _gramsHair,
        onPrimary = _white,
        background = _whiteSmoke,
        onBackground = _white,
        error = _cruelRuby,
        onError = _white,
        statusWarning = _yuzuMarmalade,
        statusSuccess = _benzolGreen,
        transparent = _transparent,
        secondary = _orangeDojo,
        onSecondary = _white,
        surface = _white,
        onSurface = _blackMetal,
        disable = _grey;

  /// Instantiate ThemeColorsData with [ThemeMode.dark] data.
  const ThemeColorsData.dark()
      : brightness = Brightness.light,
        primary = _canonBlue,
        primaryLight = _canonBlue,
        grey300 = _salonBleu,
        grey200 = _silverSprings,
        grey100 = _grainOfSalt,
        grey50 = _gramsHair,
        onPrimary = _blackIsBack,
        background = _blackIsBack,
        onBackground = _whiteSmoke,
        error = _cruelRuby,
        onError = _white,
        statusWarning = _yuzuMarmalade,
        statusSuccess = _benzolGreen,
        transparent = _transparent,
        secondary = _whiteSmoke,
        onSecondary = _blackBeauty,
        surface = _skyCaptain,
        onSurface = _whiteSmoke,
        disable = _grey;

  /// The overall brightness of this color scheme.
  final Brightness brightness;

  /// The color displayed most frequently across your app’s screens and
  /// components.
  final Color primary;

  /// A lighter version of the primary color.
  final Color primaryLight;

  /// Placeholders et disabled states.
  final Color grey300;

  /// Disabled texts.
  final Color grey200;

  /// Background disabled.
  final Color grey100;

  /// Background of fields, dividers.
  final Color grey50;

  /// A color that's clearly legible when drawn on [primary].
  final Color onPrimary;

  /// A color that typically appears behind scrollable content.
  final Color background;

  /// A color that's clearly legible when drawn on [background].
  final Color onBackground;

  /// The color to use for input validation errors, e.g. for
  /// [InputDecoration.errorText].
  final Color error;

  /// A color that's clearly legible when drawn on [error].
  final Color onError;

  /// An accent color used for less prominent components in the UI, such as
  /// filter chips, while expanding the opportunity for color expression.
  final Color secondary;

  /// A color that's clearly legible when drawn on [secondary].
  final Color onSecondary;

  /// The background color for widgets like [Card].
  final Color surface;

  /// A color that's clearly legible when drawn on [surface].
  final Color onSurface;

  /// The color to use to express warning
  final Color statusWarning;

  /// The color to use to express success
  final Color statusSuccess;

  /// Completely invisible.
  final Color transparent;

  /// Color to use to express disable
  final Color disable;

  /// Color to use for [Text] over a background.
  Color get text => onBackground;

  /// [ColorScheme] generated from [ThemeColorsData].
  ColorScheme get colorsScheme => ColorScheme(
        brightness: brightness,
        primary: primary,
        onPrimary: onPrimary,
        error: error,
        onError: onError,
        secondary: secondary,
        onSecondary: onSecondary,
        surface: surface,
        onSurface: onSurface,
      );

  /// Props used in our test to link a color to its name
  @visibleForTesting
  List<Named<Object?>> get namedProps => [
        brightness.named('brightness'),
        primary.named('primary'),
        primaryLight.named('primaryLight'),
        grey50.named('grey50'),
        grey100.named('grey100'),
        grey200.named('grey200'),
        grey300.named('grey300'),
        onPrimary.named('onPrimary'),
        background.named('background'),
        onBackground.named('onBackground'),
        error.named('error'),
        onError.named('onError'),
        statusWarning.named('statusWarning'),
        statusSuccess.named('statusSuccess'),
        secondary.named('secondary'),
        onSecondary.named('onSecondary'),
        surface.named('surface'),
        onSurface.named('onSurface'),
        transparent.named('transparent'),
        disable.named('disable'),
      ];

  @override
  List<Object?> get props => [
        brightness,
        primary,
        primaryLight,
        grey50,
        grey100,
        grey200,
        grey300,
        onPrimary,
        background,
        onBackground,
        error,
        onError,
        statusWarning,
        statusSuccess,
        secondary,
        onSecondary,
        surface,
        onSurface,
        transparent,
        disable,
      ];
}

/// [ThemeExtension] for theme colors providing the capability to
/// smoothly transition from a [ThemeColorsData] to another
///
/// Leveraging Flutter 3's [ThemeExtension] system
class ThemeColorsDataExtension
    extends ThemeExtension<ThemeColorsDataExtension> {
  /// default constructor.
  const ThemeColorsDataExtension({required this.colors});

  /// [ThemeColorsData] which will be accessible through this theme
  /// extension
  final ThemeColorsData colors;

  @override
  ThemeColorsDataExtension copyWith({ThemeColorsData? colors}) {
    return ThemeColorsDataExtension(colors: colors ?? this.colors);
  }

  @override
  ThemeColorsDataExtension lerp(
    ThemeExtension<ThemeColorsDataExtension>? other,
    double t,
    // ignore: avoid-long-functions , not possible nor uselful to split this
  ) {
    final scopedOther = other as ThemeColorsDataExtension?;

    return ThemeColorsDataExtension(
      colors: ThemeColorsData(
        brightness: t < 0.5
            ? colors.brightness
            : (scopedOther?.colors.brightness ?? colors.brightness),
        primary: ColorLerp.safeLerp(
          colors.primary,
          scopedOther?.colors.primary,
          t,
        ),
        primaryLight: ColorLerp.safeLerp(
          colors.primaryLight,
          scopedOther?.colors.primaryLight,
          t,
        ),
        grey50: ColorLerp.safeLerp(
          colors.grey50,
          scopedOther?.colors.grey50,
          t,
        ),
        grey100: ColorLerp.safeLerp(
          colors.grey100,
          scopedOther?.colors.grey100,
          t,
        ),
        grey200: ColorLerp.safeLerp(
          colors.grey200,
          scopedOther?.colors.grey200,
          t,
        ),
        grey300: ColorLerp.safeLerp(
          colors.grey300,
          scopedOther?.colors.grey300,
          t,
        ),
        onPrimary: ColorLerp.safeLerp(
          colors.onPrimary,
          scopedOther?.colors.onPrimary,
          t,
        ),
        background: ColorLerp.safeLerp(
          colors.background,
          scopedOther?.colors.background,
          t,
        ),
        onBackground: ColorLerp.safeLerp(
          colors.onBackground,
          scopedOther?.colors.onBackground,
          t,
        ),
        error: ColorLerp.safeLerp(
          colors.error,
          scopedOther?.colors.error,
          t,
        ),
        onError: ColorLerp.safeLerp(
          colors.onError,
          scopedOther?.colors.onError,
          t,
        ),
        statusWarning: ColorLerp.safeLerp(
          colors.statusWarning,
          scopedOther?.colors.statusWarning,
          t,
        ),
        statusSuccess: ColorLerp.safeLerp(
          colors.statusSuccess,
          scopedOther?.colors.statusSuccess,
          t,
        ),
        secondary: ColorLerp.safeLerp(
          colors.secondary,
          scopedOther?.colors.secondary,
          t,
        ),
        onSecondary: ColorLerp.safeLerp(
          colors.onSecondary,
          scopedOther?.colors.onSecondary,
          t,
        ),
        surface: ColorLerp.safeLerp(
          colors.surface,
          scopedOther?.colors.surface,
          t,
        ),
        onSurface: ColorLerp.safeLerp(
          colors.onSurface,
          scopedOther?.colors.onSurface,
          t,
        ),
        disable: ColorLerp.safeLerp(
          colors.disable,
          scopedOther?.colors.disable,
          t,
        ),
      ),
    );
  }
}

extension ColorLerp on Color {
  static Color safeLerp(Color a, Color? b, double t) {
    // ignore: avoid-non-null-assertion , lerp is only null if a==b==null
    return Color.lerp(a, b, t)!;
  }
}
