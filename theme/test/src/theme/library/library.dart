import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/flutter_bam_theme.dart';
import 'package:flutter_bam_theme/src/utils/named.dart';

import 'base.dart';

part 'colors.dart';
part 'radius.dart';
part 'spacing.dart';
part 'typography.dart';
part 'image.dart';

class ThemeLibrary extends StatefulWidget {
  const ThemeLibrary({
    super.key,
  });

  @override
  State<ThemeLibrary> createState() => _ThemeLibraryState();
}

class _ThemeLibraryState extends State<ThemeLibrary> {
  ThemeMode _themeMode = ThemeMode.light;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,
      home: Stack(
        children: [
          Builder(
            builder: (context) {
              return ThemeContainer(
                title: 'FlutterBam Theme',
                sections: [
                  colors(context),
                  typography(context),
                  radius(context),
                  spacing(context),
                  images(context),
                ],
              );
            },
          ),
          Positioned(
            top: 50,
            right: 40,
            child: Material(
              color: Colors.transparent,
              child: Switch(
                value: _themeMode == ThemeMode.dark,
                onChanged: (isLight) => setState(
                  () {
                    if (isLight) {
                      _themeMode = ThemeMode.dark;
                    } else {
                      _themeMode = ThemeMode.light;
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
