import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_theme.dart';

void main() {
  testWidgets('dark theme', (tester) async {
    await tester.pumpTheme(
      const Text('Hello World'),
      isDarkTheme: true,
    );
  });
}
