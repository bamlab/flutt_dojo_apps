import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/src/theme/data/radius.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_theme.dart';

void main() {
  group('$ThemeRadiusData', () {
    test('should be equal to another instance with the same fields', () async {
      const firstInstance = ThemeRadiusData(
        xs: Radius.zero,
        s: Radius.zero,
        m: Radius.circular(5),
      );

      const secondInstance = ThemeRadiusData(
        xs: Radius.zero,
        s: Radius.zero,
        m: Radius.circular(5),
      );

      expect(firstInstance, secondInstance);
    });

    test('should be inequal to another instance with differents fields',
        () async {
      const firstInstance = ThemeRadiusData(
        xs: Radius.zero,
        s: Radius.zero,
        m: Radius.circular(5),
      );

      const secondInstance = ThemeRadiusData(
        xs: Radius.zero,
        s: Radius.zero,
        m: Radius.circular(15),
      );

      expect(firstInstance == secondInstance, isFalse);
    });

    test('should name every props in namedProps getter', () async {
      const instance = ThemeRadiusData(
        xs: Radius.elliptical(1, 2),
        s: Radius.zero,
        m: Radius.circular(5),
      );

      expect(
        instance.props,
        instance.namedProps.map((namedProp) => namedProp.value),
      );
    });
  });

  group('$ThemeBorderRadiusData', () {
    testWidgets('xs', (tester) async {
      await tester.pumpTheme(
        ColoredBox(
          color: Colors.white,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const ThemeRadiusData.regular().asBorderRadius.xs,
              color: Colors.black,
            ),
          ),
        ),
      );
      await expectLater(
        find.byType(ColoredBox).first,
        matchesGoldenFile('goldens/border_radius_xs.png'),
      );
    });

    testWidgets('s', (tester) async {
      await tester.pumpTheme(
        ColoredBox(
          color: Colors.white,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const ThemeRadiusData.regular().asBorderRadius.s,
              color: Colors.black,
            ),
          ),
        ),
      );
      await expectLater(
        find.byType(ColoredBox).first,
        matchesGoldenFile('goldens/border_radius_s.png'),
      );
    });

    testWidgets('m', (tester) async {
      await tester.pumpTheme(
        ColoredBox(
          color: Colors.white,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const ThemeRadiusData.regular().asBorderRadius.m,
              color: Colors.black,
            ),
          ),
        ),
      );
      await expectLater(
        find.byType(ColoredBox).first,
        matchesGoldenFile('goldens/border_radius_m.png'),
      );
    });
  });
}
