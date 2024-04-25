import 'package:adaptive_test/adaptive_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/flutter_bam_theme.dart';
import 'package:flutter_test/flutter_test.dart';
import 'library/library.dart';

void main() {
  testWidgets('$Theme rendering', (tester) async {
    tester.view.physicalSize = const Size(800, 1200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    const widget = ThemeLibrary();
    await tester.pumpWidget(
      widget,
    );
    await tester.awaitImages();
    await expectLater(
      find.byType(ThemeLibrary),
      matchesGoldenFile('goldens/theme.png'),
    );

    final switchTheme = find.byType(Switch);
    await tester.tap(switchTheme);
    // pump a few frames to make sure `lerp` methods are called.
    await tester.pumpFrames(
      widget,
      const Duration(milliseconds: 50),
    );
    await tester.pumpAndSettle();
    await tester.awaitImages();
    await expectLater(
      find.byType(ThemeLibrary),
      matchesGoldenFile('goldens/darkTheme.png'),
    );
  });

  test('should hold extensions that can all be copied', () {
    final copiedExtensions =
        lightTheme.extensions.values.map((e) => e.copyWith()).toList();

    expect(
      copiedExtensions.length,
      equals(lightTheme.extensions.values.toList().length),
    );
  });
}
