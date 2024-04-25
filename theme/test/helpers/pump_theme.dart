import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/flutter_bam_theme.dart';
import 'package:flutter_test/flutter_test.dart';

extension EnhancedWidgetTester on WidgetTester {
  Future<void> pumpTheme(Widget widget, {bool isDarkTheme = false}) async {
    return pumpWidget(
      MaterialApp(
        themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
        theme: lightTheme,
        darkTheme: darkTheme,
        home: widget,
      ),
    );
  }
}
