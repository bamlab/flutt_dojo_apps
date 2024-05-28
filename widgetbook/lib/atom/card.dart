import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/cdapp_theme.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Card', type: AppCard)
Widget evToggle(BuildContext context) {
  final theme = Theme.of(context);
  final childText = context.knobs
      .string(label: 'child text', initialValue: "Hi, I'm the child");
  final bottomText = context.knobs
      .string(label: 'bottom text', initialValue: "Hi, I'm the bottom");

  return Scaffold(
    appBar: AppBar(
      title: AppText.titleMedium('Card', color: theme.colors.onSurface),
    ),
    body: Padding(
      padding: theme.sizes.asInsets.m,
      child: AppCard(
        bottom: AppText.bodySmall(
          bottomText,
          color: theme.colors.onSurface,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: theme.colors.secondary,
            borderRadius: theme.radius.asBorderRadius.s,
          ),
          child: Center(
            child: Padding(
              padding: theme.sizes.asInsets.l,
              child: AppText.bodyMedium(
                childText,
                color: theme.colors.onSurface,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
