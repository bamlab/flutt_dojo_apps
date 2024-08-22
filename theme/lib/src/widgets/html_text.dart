// ignore_for_file: avoid-non-null-assertion

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
  const HtmlText({required this.content, super.key, this.style});

  final String content;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Html(
      data: content,
      style: {
        '*': Style.fromTextStyle(style ?? theme.textTheme.bodyMedium!),
        'b': Style.fromTextStyle(
          theme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),
        ),
        'body': Style(padding: HtmlPaddings.zero, margin: Margins.zero),
        'del': Style.fromTextStyle(
          theme.textTheme.bodyMedium!.copyWith(
            decoration: TextDecoration.lineThrough,
          ),
        ),
        'em': Style.fromTextStyle(
          theme.textTheme.bodyMedium!.copyWith(fontStyle: FontStyle.italic),
        ),
        'h1': Style.fromTextStyle(theme.textTheme.titleLarge!),
        'h2': Style.fromTextStyle(theme.textTheme.titleMedium!),
        'h3': Style.fromTextStyle(theme.textTheme.titleMedium!),
        'h4': Style.fromTextStyle(theme.textTheme.titleSmall!),
        'h5': Style.fromTextStyle(theme.textTheme.titleSmall!),
        'h6': Style.fromTextStyle(theme.textTheme.titleSmall!),
        'i': Style.fromTextStyle(
          theme.textTheme.bodyMedium!.copyWith(fontStyle: FontStyle.italic),
        ),
        'ins': Style.fromTextStyle(
          theme.textTheme.bodyMedium!.copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
        'mark': Style.fromTextStyle(
          theme.textTheme.bodyMedium!.copyWith(
            backgroundColor: theme.colorScheme.secondary.withOpacity(0.2),
          ),
        ),
        'small': Style.fromTextStyle(theme.textTheme.bodySmall!),
        'strong': Style.fromTextStyle(
          theme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),
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
