// widgetbook.dart

import 'package:dojo_widgetbook/widgetbook.directories.g.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      appBuilder: (context, child) {
        return MaterialApp(home: child, debugShowCheckedModeBanner: false);
      },
      addons: [
        DeviceFrameAddon(devices: devices, initialDevice: Devices.ios.iPhone13),
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(name: 'Light', data: ThemeData.light()),
            WidgetbookTheme(name: 'Dark', data: ThemeData.dark()),
          ],
        ),
        TextScaleAddon(
          scales: [0.75, 1.0, 1.25, 1.5, 1.75, 2, 3.0],
          initialScale: 1,
        ),
      ],
    );
  }
}

final devices = [
  Devices.ios.iPhone13,
  Devices.ios.iPhone13Mini,
  Devices.ios.iPhoneSE,
  Devices.android.smallPhone,
  Devices.android.onePlus8Pro,
  Devices.android.samsungGalaxyS20,
];
