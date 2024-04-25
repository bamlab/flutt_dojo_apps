import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/src/theme/data/colors.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$ThemeColorsData', () {
    test('should be equal to another instance with the same fields', () async {
      const firstInstance = ThemeColorsData.light();

      const secondInstance = ThemeColorsData.light();

      expect(firstInstance, secondInstance);
    });

    test('should be inequal to another instance with differents fields',
        () async {
      const firstInstance = ThemeColorsData.light();

      const secondInstance = ThemeColorsData(
        brightness: Brightness.dark,
        primary: Colors.red,
        onPrimary: Colors.white,
        background: Colors.white,
        onBackground: Colors.black,
        error: Colors.red,
        onError: Colors.white,
        statusWarning: Colors.orange,
        statusSuccess: Colors.green,
        secondary: Colors.blue,
        onSecondary: Colors.white,
        surface: Colors.white,
        onSurface: Colors.black,
        disable: Colors.grey,
      );

      expect(firstInstance == secondInstance, isFalse);
    });

    test('should name every props in namedProps getter', () async {
      const instance = ThemeColorsData.light();

      expect(
        instance.props,
        instance.namedProps.map((namedProp) => namedProp.value),
      );
    });
  });
}
