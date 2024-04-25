import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../flutter_bam_theme.dart';
import 'data/breakpoints.dart';
import 'data/colors.dart';
import 'data/radius.dart';
import 'data/sizes.dart';

/// Flutter Bam custom [ThemeData]. `ThemeMode.light` version.
ThemeData get lightTheme {
  const colors = ThemeColorsData.light();
  return _getThemeDataFromColors(colors);
}

/// Flutter Bam custom [ThemeData]. `ThemeMode.dark` version.
ThemeData get darkTheme {
  const colors = ThemeColorsData.dark();
  return _getThemeDataFromColors(colors);
}

ThemeData _getThemeDataFromColors(ThemeColorsData colors) {
  final fallbackTheme = ThemeData.fallback();

  final textTheme = ThemeTypographyData.fromColors(colors);
  const sizes = ThemeSizeData.regular();
  const radius = ThemeRadiusData.regular();
  const borderRadius = ThemeBorderRadiusData(radius);

  const buttonMinimumSize = Size(64, kMinInteractiveDimensionCupertino);

  return fallbackTheme.copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: colors.primary,
      titleTextStyle: textTheme.titleLarge!.copyWith(color: colors.onPrimary),
    ),
    scaffoldBackgroundColor: colors.background,
    textTheme: textTheme,
    colorScheme: colors.colorsScheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(buttonMinimumSize),
        elevation: MaterialStateProperty.all(0),
        textStyle: MaterialStateProperty.all(
          textTheme.labelLarge?.copyWith(color: colors.onPrimary),
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            vertical: sizes.s,
            horizontal: sizes.xl,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: borderRadius.m),
        ),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return colors.disable;
          }
          return colors.primary;
        }),
        foregroundColor: MaterialStateProperty.all(colors.onPrimary),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(buttonMinimumSize),
        elevation: MaterialStateProperty.all(0),
        side: MaterialStateProperty.resolveWith((states) {
          Color borderColor;

          if (states.contains(MaterialState.disabled)) {
            borderColor = colors.disable;
          } else {
            borderColor = colors.primary;
          }

          return BorderSide(
            color: borderColor,
            width: 2,
          );
        }),
        textStyle: MaterialStateProperty.all(
          textTheme.labelLarge?.copyWith(color: colors.onPrimary),
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            vertical: sizes.s,
            horizontal: sizes.xl,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: borderRadius.m),
        ),
        backgroundColor: MaterialStateProperty.all(colors.background),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return colors.disable;
          }
          return colors.primary;
        }),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(buttonMinimumSize),
        elevation: MaterialStateProperty.all(0),
        textStyle: MaterialStateProperty.all(
          textTheme.labelLarge?.copyWith(color: colors.onBackground),
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            vertical: sizes.s,
            horizontal: sizes.xl,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: borderRadius.m),
        ),
        backgroundColor: MaterialStateProperty.all(colors.transparent),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return colors.disable;
          }
          return colors.onBackground;
        }),
      ),
    ),
    extensions: [
      const ThemeRadiusDataExtension(radius: ThemeRadiusData.regular()),
      const ThemeSizeDataExtension(sizes: ThemeSizeData.regular()),
      ThemeColorsDataExtension(colors: colors),
      const ThemeBreakpointsDataExtension(
        breakpoints: ThemeBreakpointsData.regular(),
      ),
    ],
  );
}

/// Extension for [ThemeData] to add getters for each theme extensions.
///
/// See: [ThemeExtension].
/// Eg. [radius], [sizes], [colors], [breakpoints].
extension ThemeDataX on ThemeData {
  /// Returns [ThemeRadiusData].
  ///
  /// Must be call in a sub-tree of a [Theme] widget, with the
  /// [ThemeRadiusDataExtension] registered.
  ThemeRadiusData get radius => extension<ThemeRadiusDataExtension>()!.radius;

  /// Returns [ThemeSizeData].
  ///
  /// Must be call in a sub-tree of a [Theme] widget, with the
  /// [ThemeSizeDataExtension] registered.
  ThemeSizeData get sizes => extension<ThemeSizeDataExtension>()!.sizes;

  /// Returns [ThemeBreakpointsData].
  ///
  /// Must be call in a sub-tree of a [Theme] widget, with the
  /// [ThemeBreakpointsDataExtension] registered.
  ThemeBreakpointsData get breakpoints =>
      extension<ThemeBreakpointsDataExtension>()!.breakpoints;

  /// Returns [ThemeColorsData].
  ///
  /// Must be call in a sub-tree of a [Theme] widget, with the
  /// [ThemeColorsDataExtension] registered.
  ThemeColorsData get colors => extension<ThemeColorsDataExtension>()!.colors;
}

/// An intermediary class that holds the [BuildContext].
/// It allows us to group every theme related [ThemeExtension] in one getter,
/// avoiding having to much context extensions in the app.
class ThemeState {
  /// default constructor.
  const ThemeState(this.context);

  /// [BuildContext] field to be accessed in others extensions
  final BuildContext context;
}

/// Extends [BuildContext] with [ThemeState] to provide access to Theme related
/// capabilities such as:
/// * [ScreenDimensionsAwareness]
extension ThemeStateX on BuildContext {
  /// Provides theme data and utils function that need context to be computed.
  ///
  /// Eg. [ThemeBreakpointsData]
  ThemeState get themeState => ThemeState(this);
}

/// Extends the ThemeState class with some awareness of the screen dimensions
/// based on the [BuildContext] and [MediaQuery].
/// e.g. [isLargeScreen]
extension ScreenDimensionsAwareness on ThemeState {
  /// Based on [MediaQuery] `size` and [Theme] `breakpoints`.
  bool get isLargeScreen {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    return mediaQuery.size.width >= theme.breakpoints.horizontalBreakpoint;
  }
}
