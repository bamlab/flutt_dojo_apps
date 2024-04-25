import 'package:adaptive_test/adaptive_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/flutter_bam_theme.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('isLargeScreen', () {
    testWidgets('should return false on small screen', (tester) async {
      late BuildContext capturedContext;

      tester.configureWindow(iPhone8);

      await tester.pumpWidget(
        MaterialApp(
          theme: lightTheme,
          darkTheme: darkTheme,
          home: Builder(
            builder: (context) {
              capturedContext = context;
              return Container();
            },
          ),
        ),
      );
      expect(
        capturedContext.themeState.isLargeScreen,
        false,
      );
    });

    testWidgets('should return true on large screen', (tester) async {
      late BuildContext capturedContext;

      tester.configureWindow(desktop);

      await tester.pumpWidget(
        MaterialApp(
          theme: lightTheme,
          darkTheme: darkTheme,
          home: Builder(
            builder: (context) {
              capturedContext = context;
              return Container();
            },
          ),
        ),
      );
      expect(
        capturedContext.themeState.isLargeScreen,
        true,
      );
    });
  });
}
