import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bam_theme/cdapp_theme.dart';

class AppDismissibleImage extends StatefulWidget {
  const AppDismissibleImage({
    required this.url,
    super.key,
    this.heroTag,
    this.actions,
  });

  final String url;
  final String? heroTag;
  final List<Widget>? actions;

  @override
  State<AppDismissibleImage> createState() => _AppDismissibleImageState();
}

class _AppDismissibleImageState extends State<AppDismissibleImage> {
  bool isAppBarDisplayed = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final actions = widget.actions;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: theme.colors.transparent,
      appBar: isAppBarDisplayed
          ? AppBar(
              backgroundColor: theme.colors.transparent,
              automaticallyImplyLeading: false,
              centerTitle: false,
              title: Row(
                children: [
                  const DefaultAppLeading(),
                  if (actions != null) ...[
                    const Spacer(),
                    DividedRow(
                      customSeparator: const AppGap.m(),
                      children: actions,
                    ),
                  ],
                ],
              ),
            )
          : null,
      body: DismissiblePage(
        direction: DismissiblePageDismissDirection.down,
        key: Key(widget.url),
        onDismissed: Navigator.of(context).pop,
        child: AppPhotoView(url: widget.url, heroTag: widget.heroTag),
        // coverage:ignore-start
        onDragStart: () => setState(() => isAppBarDisplayed = false),
        onDragEnd: () => setState(() => isAppBarDisplayed = true),
        // coverage:ignore-end
      ),
    );
  }
}
