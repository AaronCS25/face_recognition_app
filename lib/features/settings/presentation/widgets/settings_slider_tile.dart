import 'package:cvpr_face_recognition/config/helpers/human_formats.dart';
import 'package:flutter/material.dart';
import 'package:cvpr_face_recognition/features/shared/shared.dart';

class SettingsSliderTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final double value;
  final ValueChanged<double> onChanged;
  final double min;
  final double max;
  final int divisions;

  const SettingsSliderTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max = 100,
    this.divisions = 10,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: theme.textTheme.bodyLarge),
            CustomTag(
              label: "${HumanFormats.formatDouble(value)}%",
              type: TagType.secondary,
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(subtitle, style: theme.textTheme.bodyMedium),
        const SizedBox(height: 12),
        Slider(
          padding: EdgeInsets.zero,
          value: value,
          min: min,
          max: max,
          divisions: divisions,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
