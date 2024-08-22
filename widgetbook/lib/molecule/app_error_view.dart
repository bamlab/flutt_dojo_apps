import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/cdapp_theme.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

const _kpageName = 'App error view';

@widgetbook.UseCase(name: _kpageName, type: AppErrorView)
Widget appErrorView(BuildContext context) {
  final theme = Theme.of(context);
  final title = context.knobs.string(label: 'title', initialValue: 'title');
  final color = context.knobs.color(
    label: title,
    initialValue: theme.colors.error,
  );
  final message = context.knobs.string(
    label: 'message',
    initialValue: 'message',
  );
  final bottomText = context.knobs
      .string(label: 'bottom text', initialValue: "Hi, I'm the bottom");
  final isRefreshing = context.knobs.boolean(label: 'isRefreshing');
  final showIcon = context.knobs.boolean(
    label: 'showIcon',
    initialValue: true,
  );

  return Scaffold(
    appBar: AppBar(
      title: AppText.titleMedium(_kpageName, color: theme.colors.onSurface),
    ),
    body: Padding(
      padding: theme.sizes.asInsets.m,
      child: AppErrorView(
        title: title,
        message: message,
        icon: showIcon ? Icons.error : null,
        bottomWidget: AppText.bodySmall(
          bottomText,
          color: theme.colors.onSurface,
        ),
        isRefreshing: isRefreshing,
        color: color,
      ),
    ),
  );
}
