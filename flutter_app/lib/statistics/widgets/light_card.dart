import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class LightCard extends StatelessWidget {
  const LightCard({
    required this.child,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    this.border,
    this.hasBorder = true,
    super.key,
  });

  final Widget child;
  // can't pass it a default value because Color.withOpacity is not const
  /// The border to paint in the background of the box.
  /// If null, the default is a white linear gradient.
  final BoxBorder? border;
  final BorderRadiusGeometry borderRadius;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: hasBorder
            ? border ??
                GradientBoxBorder(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withOpacity(0.4),
                      Colors.white.withOpacity(0),
                      Colors.white.withOpacity(0),
                      Colors.white.withOpacity(0.1),
                    ],
                  ),
                )
            : null,
        color: Colors.white.withOpacity(0.2),
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}
