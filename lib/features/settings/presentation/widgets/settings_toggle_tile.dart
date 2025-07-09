import 'package:flutter/material.dart';

class SettingsToggleTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Widget? leading;

  const SettingsToggleTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (leading != null) ...[leading!, const SizedBox(width: 8)],
                Text(title, style: theme.textTheme.bodyLarge),
              ],
            ),
            const SizedBox(height: 4),
            Text(subtitle, style: theme.textTheme.bodyMedium),
          ],
        ),
        Switch(value: value, onChanged: onChanged),
      ],
    );
  }
}
