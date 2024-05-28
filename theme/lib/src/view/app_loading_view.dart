import 'package:flutter/material.dart';

import 'package:flutter_bam_theme/src/widgets/loader.dart';

class AppLoadingView extends StatelessWidget {
  const AppLoadingView({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppLoader.big(color: color),
    );
  }
}
