import 'package:flutter/material.dart';

class AppRoundSliderThumbShape extends RoundSliderThumbShape {
  const AppRoundSliderThumbShape({
    this.strokeWidth = 0,
    this.strokeColor,
    super.enabledThumbRadius,
  });

  final double strokeWidth;

  final Color? strokeColor;

  double get _disabledThumbRadius => disabledThumbRadius ?? enabledThumbRadius;

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;
    final radiusTween = Tween<double>(
      begin: _disabledThumbRadius,
      end: enabledThumbRadius,
    );
    final colorTween = ColorTween(
      begin: sliderTheme.disabledThumbColor,
      end: sliderTheme.thumbColor,
    );

    final color = colorTween.evaluate(enableAnimation)!;
    final radius = radiusTween.evaluate(enableAnimation);

    canvas.drawCircle(
      center,
      radius,
      Paint()..color = color,
    );

    canvas.drawCircle(
      center,
      radius - strokeWidth,
      Paint()..color = strokeColor ?? Colors.transparent,
    );
  }
}
