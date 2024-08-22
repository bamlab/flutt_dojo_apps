import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/src/theme/themes_data.dart';

class ContentSwitcher<T> extends StatefulWidget {
  const ContentSwitcher({
    required this.initialContent,
    required this.contentBuilder,
    super.key,
  });

  final T initialContent;
  final Widget Function(
    BuildContext context,
    T content,
    void Function(T content) switchToContent,
  ) contentBuilder;

  @override
  State<ContentSwitcher<T>> createState() => _ContentSwitcherState<T>();
}

class _ContentSwitcherState<T> extends State<ContentSwitcher<T>> {
  late T _currentContent = widget.initialContent;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedSize(
      duration: theme.durations.xxs,
      child: AnimatedSwitcher(
        duration: theme.durations.xxs,
        child: widget.contentBuilder(
          context,
          _currentContent,
          (newContent) => setState(() {
            _currentContent = newContent;
          }),
        ),
      ),
    );
  }
}
