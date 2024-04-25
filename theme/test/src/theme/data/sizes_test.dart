import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/src/theme/data/sizes.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_theme.dart';

void main() {
  group('$ThemeSizeData', () {
    test('should be equal to another instance with the same fields', () async {
      const firstInstance = ThemeSizeData(
        xs: 3,
        s: 4,
        m: 5,
        l: 6,
        xl: 7,
      );

      const secondInstance = ThemeSizeData(
        xs: 3,
        s: 4,
        m: 5,
        l: 6,
        xl: 7,
      );

      expect(firstInstance, secondInstance);
    });

    test('should be inequal to another instance with differents fields',
        () async {
      const firstInstance = ThemeSizeData(
        xs: 3,
        s: 4,
        m: 5,
        l: 6,
        xl: 7,
      );

      const secondInstance = ThemeSizeData(
        xs: 3,
        s: 3.5,
        m: 5,
        l: 7,
        xl: 8,
      );

      expect(firstInstance == secondInstance, isFalse);
    });

    test('should name every props in namedProps getter', () async {
      const instance = ThemeSizeData(
        xs: 3,
        s: 4,
        m: 5,
        l: 6,
        xl: 7,
      );

      expect(
        instance.props,
        instance.namedProps.map((namedProp) => namedProp.value),
      );
    });

    group('asInsets getter', () {
      testWidgets('xs', (tester) async {
        await tester.pumpTheme(
          ColoredBox(
            color: Colors.white,
            child: Container(
              padding: const ThemeSizeData.regular().asInsets.xs,
              child: const ColoredBox(color: Colors.black),
            ),
          ),
        );
        await expectLater(
          find.byType(ColoredBox).first,
          matchesGoldenFile('goldens/insets_xs.png'),
        );
      });

      testWidgets('s', (tester) async {
        await tester.pumpTheme(
          ColoredBox(
            color: Colors.white,
            child: Container(
              padding: const ThemeSizeData.regular().asInsets.s,
              child: const ColoredBox(color: Colors.black),
            ),
          ),
        );
        await expectLater(
          find.byType(ColoredBox).first,
          matchesGoldenFile('goldens/insets_s.png'),
        );
      });

      testWidgets('m', (tester) async {
        await tester.pumpTheme(
          ColoredBox(
            color: Colors.white,
            child: Container(
              padding: const ThemeSizeData.regular().asInsets.m,
              child: const ColoredBox(color: Colors.black),
            ),
          ),
        );
        await expectLater(
          find.byType(ColoredBox).first,
          matchesGoldenFile('goldens/insets_m.png'),
        );
      });

      testWidgets('l', (tester) async {
        await tester.pumpTheme(
          ColoredBox(
            color: Colors.white,
            child: Container(
              padding: const ThemeSizeData.regular().asInsets.l,
              child: const ColoredBox(color: Colors.black),
            ),
          ),
        );
        await expectLater(
          find.byType(ColoredBox).first,
          matchesGoldenFile('goldens/insets_l.png'),
        );
      });

      testWidgets('xl', (tester) async {
        await tester.pumpTheme(
          ColoredBox(
            color: Colors.white,
            child: Container(
              padding: const ThemeSizeData.regular().asInsets.xl,
              child: const ColoredBox(color: Colors.black),
            ),
          ),
        );
        await expectLater(
          find.byType(ColoredBox).first,
          matchesGoldenFile('goldens/insets_xl.png'),
        );
      });
    });
  });
}
