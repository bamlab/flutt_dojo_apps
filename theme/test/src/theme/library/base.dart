import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/flutter_bam_theme.dart';

class ThemeContainer extends StatelessWidget {
  const ThemeContainer({
    super.key,
    required this.title,
    required this.sections,
  });
  final String title;
  final List<ThemeSection> sections;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colors.background,
      body: Padding(
        padding: theme.sizes.asInsets.l,
        child: SpacedColumn(
          spaceBetween: theme.sizes.m,
          children: [
            ThemeText.titleLarge(
              title,
              color: theme.colors.text,
            ),
            ...sections,
          ],
        ),
      ),
    );
  }
}

class ThemeSection extends StatelessWidget {
  const ThemeSection({
    super.key,
    required this.title,
    required this.categories,
  });

  final String title;
  final List<ThemeCategory> categories;

  @override
  Widget build(BuildContext context) {
    return SpacedColumn(
      spaceBetween: 20,
      children: [
        ThemeText.titleMedium(
          title,
          color: Theme.of(context).colors.text,
        ),
        ...categories,
      ],
    );
  }
}

class ThemeCategory extends StatelessWidget {
  const ThemeCategory({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ThemeText.titleMedium(title),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: children,
        ),
      ],
    );
  }
}

class SpacedColumn extends StatelessWidget {
  const SpacedColumn({
    super.key,
    required this.spaceBetween,
    required this.children,
  });

  final double spaceBetween;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (children.isNotEmpty) children.first,
        ...children
            .skip(1)
            .map(
              (e) => <Widget>[
                SizedBox(height: spaceBetween),
                e,
              ],
            )
            .expand((e) => e),
      ],
    );
  }
}

class ThemeCell extends StatelessWidget {
  const ThemeCell({
    super.key,
    required this.child,
    required this.title,
  });

  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: theme.sizes.asInsets.xs,
          decoration: BoxDecoration(
            border: Border.all(
              color: theme.colors.onBackground.withAlpha(125),
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: child,
        ),
        ThemeText.bodyMedium(title),
      ],
    );
  }
}
