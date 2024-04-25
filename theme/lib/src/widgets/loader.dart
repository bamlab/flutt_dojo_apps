import 'package:flutter/material.dart';

import '../../flutter_bam_theme.dart';
/// ThemeLoader widget used whenever you need to display a loader in your app
class ThemeLoader extends StatelessWidget {
  /// Default constructor
  const ThemeLoader({
    super.key,
    this.color,
    this.size,
  });

  /// Size to give to your [ThemeLoader]
  ///
  /// Default to square size [ThemeSizeData.m]
  final Size? size;

  /// Color to give to your [ThemeLoader]
  ///
  /// Default to [ThemeColorsData.onBackground]
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final size = this.size ?? Size.square(theme.sizes.m);
    final color = this.color ?? theme.colors.onBackground;

    return SizedBox.fromSize(
      size: size,
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
