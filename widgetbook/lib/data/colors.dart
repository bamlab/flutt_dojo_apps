import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/cdapp_theme.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

const _kpageName = 'colors';

@widgetbook.UseCase(name: _kpageName, type: ColoredBox, path: '[data]')
Widget colors(BuildContext context) {
  final colors = Theme.of(context).colors;

  return Scaffold(
    appBar:
        AppBar(title: AppText.titleMedium(_kpageName, color: colors.onSurface)),
    body: SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _colorItem(
                // primary and onPrimary
                name: 'primary',
                color: colors.primary,
                onColorName: 'onPrimary',
                onColor: colors.onPrimary,
              ),
              _colorItem(
                // primaryLight
                name: 'primaryLight',
                color: colors.primaryLight,
              ),
              _colorItem(name: 'grey300', color: colors.grey300),
              _colorItem(name: 'grey200', color: colors.grey200),
              _colorItem(name: 'grey100', color: colors.grey100),
              _colorItem(name: 'grey50', color: colors.grey50),
              _colorItem(
                // background and onBackground
                name: 'background',
                color: colors.background,
                onColorName: 'onBackground',
                onColor: colors.onBackground,
              ),
              _colorItem(
                // error and onError
                name: 'error',
                color: colors.error,
                onColorName: 'onError',
                onColor: colors.onError,
              ),
              _colorItem(name: 'statusWarning', color: colors.statusWarning),
              _colorItem(name: 'statusSuccess', color: colors.statusSuccess),
              _colorItem(
                // secondary and onSecondary
                name: 'secondary',
                color: colors.secondary,
                onColorName: 'onSecondary',
                onColor: colors.onSecondary,
              ),
              _colorItem(
                // surface and onSurface
                name: 'surface',
                color: colors.surface,
                onColorName: 'onSurface',
                onColor: colors.onSurface,
              ),
              _colorItem(name: 'disable', color: colors.disable),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _colorItem({
  required String name,
  required Color color,
  String? onColorName,
  Color? onColor,
}) {
  return Builder(
    builder: (context) {
      final theme = Theme.of(context);

      return Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            SizedBox(
              width: 120,
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: theme.colors.onSurface,
                ),
              ),
            ),
            const AppGap.xl(),
            SizedBox(
              width: 120,
              height: 70,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: onColorName != null
                      ? Text(
                          onColorName,
                          style: TextStyle(color: onColor, fontSize: 12),
                        )
                      : const SizedBox.shrink(),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
