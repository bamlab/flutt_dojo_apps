import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/cdapp_theme.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

const _kpageName = 'App loading view';

@widgetbook.UseCase(name: _kpageName, type: AppLoadingView)
Widget appLoadingView(BuildContext context) {
  final theme = Theme.of(context);
  final color = context.knobs.color(
    label: 'title',
    initialValue: theme.colors.primary,
  );

  return Scaffold(
    appBar: AppBar(
      title: AppText.titleMedium(_kpageName, color: theme.colors.onSurface),
    ),
    body: Padding(
      padding: theme.sizes.asInsets.m,
      child: AppLoadingView(
        color: color,
      ),
    ),
  );
}
