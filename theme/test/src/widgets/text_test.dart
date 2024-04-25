import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/flutter_bam_theme.dart';
import 'package:flutter_bam_theme/src/utils/named.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_theme.dart';

void main() {
  group('$ThemeText', () {
    final textVariant = ValueVariant({
      ThemeText.displayMedium.named('displayMedium'),
      ThemeText.headlineLarge.named('headlineLarge'),
      ThemeText.headlineMedium.named('headlineMedium'),
      ThemeText.headlineSmall.named('headlineSmall'),
      ThemeText.titleLarge.named('titleLarge'),
      ThemeText.titleMedium.named('titleMedium'),
      ThemeText.titleSmall.named('titleSmall'),
      ThemeText.bodyLarge.named('bodyLarge'),
      ThemeText.bodyMedium.named('bodyMedium'),
      ThemeText.bodySmall.named('bodySmall'),
      ThemeText.labelLarge.named('labelLarge'),
    });

    testWidgets(
      '${textVariant.currentValue?.name}',
      (tester) async {
        await tester.pumpTheme(
          Scaffold(
            body: ColoredBox(
              color: Colors.white,
              child:
                  Center(child: textVariant.currentValue?.value('Hello world')),
            ),
          ),
        );

        await expectLater(
          find.byType(ThemeText),
          matchesGoldenFile('goldens/${textVariant.currentValue?.name}.png'),
        );
      },
      variant: textVariant,
    );
  });
}
