import 'package:flutter/material.dart';
import 'package:cvpr_face_recognition/config/config.dart';

class ScoreTag extends StatelessWidget {
  final double score;

  const ScoreTag({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    final config = _getConfig(score);

    return Container(
      padding: config.padding,
      decoration: config.decoration,
      child: Text(
        "${HumanFormats.formatDouble(score)}%",
        style: config.textStyle,
      ),
    );
  }

  _ScoreTagConfig _getConfig(double score) {
    if (score >= 90) {
      return _ScoreTagConfig(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
        textStyle: const TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF16A34A),
          borderRadius: BorderRadius.circular(12.0),
        ),
      );
    } else if (score >= 80) {
      return _ScoreTagConfig(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
        textStyle: const TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFCA8A04),
          borderRadius: BorderRadius.circular(12.0),
        ),
      );
    } else {
      return _ScoreTagConfig(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
        textStyle: const TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFDC2626),
          borderRadius: BorderRadius.circular(12.0),
        ),
      );
    }
  }
}

class _ScoreTagConfig {
  final EdgeInsets padding;
  final TextStyle textStyle;
  final BoxDecoration decoration;

  _ScoreTagConfig({
    required this.padding,
    required this.textStyle,
    required this.decoration,
  });
}
