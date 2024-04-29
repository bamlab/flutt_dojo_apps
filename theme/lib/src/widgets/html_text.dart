import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

const externalElements = [
  'audio',
  'iframe',
  'img',
  'math',
  'svg',
  'table',
  'video',
];
const tableCellElements = ['th', 'td'];
const tableDefinitionElements = ['col', 'colgroup'];

class HtmlText extends StatelessWidget {
  const HtmlText({super.key, required this.content, this.style});

  final String content;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Html(
      data: content,
      style: {
        '*': Style.fromTextStyle(style ?? theme.textTheme.bodyMedium!),
        'body': Style(padding: HtmlPaddings.zero, margin: Margins.zero),
        'h1': Style.fromTextStyle(theme.textTheme.titleLarge!),
        'h2': Style.fromTextStyle(theme.textTheme.titleMedium!),
        'h3': Style.fromTextStyle(theme.textTheme.titleMedium!),
        'h4': Style.fromTextStyle(theme.textTheme.titleSmall!),
        'h5': Style.fromTextStyle(theme.textTheme.titleSmall!),
        'h6': Style.fromTextStyle(theme.textTheme.titleSmall!),
        'b': Style.fromTextStyle(
          theme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),
        ),
        'strong': Style.fromTextStyle(
          theme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),
        ),
        'i': Style.fromTextStyle(
          theme.textTheme.bodyMedium!.copyWith(fontStyle: FontStyle.italic),
        ),
        'em': Style.fromTextStyle(
          theme.textTheme.bodyMedium!.copyWith(fontStyle: FontStyle.italic),
        ),
        'mark': Style.fromTextStyle(
          theme.textTheme.bodyMedium!.copyWith(
            backgroundColor: theme.colorScheme.secondary.withOpacity(0.2),
          ),
        ),
        'small': Style.fromTextStyle(theme.textTheme.bodySmall!),
        'del': Style.fromTextStyle(
          theme.textTheme.bodyMedium!.copyWith(
            decoration: TextDecoration.lineThrough,
          ),
        ),
        'ins': Style.fromTextStyle(
          theme.textTheme.bodyMedium!.copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
        'sub': Style.fromTextStyle(
          theme.textTheme.bodyMedium!
              .copyWith(fontFeatures: [const FontFeature.subscripts()]),
        ),
        'sup': Style.fromTextStyle(
          theme.textTheme.bodyMedium!
              .copyWith(fontFeatures: [const FontFeature.superscripts()]),
        ),
      },
      doNotRenderTheseTags: const {
        ...externalElements,
        ...tableCellElements,
        ...tableDefinitionElements,
      },
    );
  }
}
