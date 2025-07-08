import 'package:flutter/material.dart';

class CustomSliderThumbShape extends SliderComponentShape {
  final double thumbRadius;
  final Color thumbColor;
  final Color borderColor;
  final double borderWidth;

  CustomSliderThumbShape({
    required this.thumbRadius,
    required this.thumbColor,
    required this.borderColor,
    this.borderWidth = 1.0,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

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
    final Canvas canvas = context.canvas;

    final Paint borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final Paint fillPaint = Paint()
      ..color = thumbColor
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, thumbRadius, fillPaint);
    canvas.drawCircle(center, thumbRadius, borderPaint);
  }
}
