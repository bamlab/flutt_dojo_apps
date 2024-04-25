import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/flutter_bam_theme.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_theme.dart';

void main() {
  group('ThemeLoader', () {
    testWidgets('should render at different times', (tester) async {
      await tester.pumpTheme(
        const Scaffold(
          body: Center(
            child: ThemeLoader(),
          ),
        ),
      );

      await expectLater(
        find.byType(ThemeLoader),
        matchesGoldenFile('goldens/theme_loader.png'),
      );

      await tester.pump(const Duration(milliseconds: 1000));

      await expectLater(
        find.byType(ThemeLoader),
        matchesGoldenFile('goldens/theme_loader_after_1000_ms.png'),
      );
    });
  });
}
