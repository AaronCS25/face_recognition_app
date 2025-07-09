import 'package:flutter/material.dart';

class SettingsListTile extends StatelessWidget {
  final String title;
  final Widget? trailing;

  const SettingsListTile({super.key, required this.title, this.trailing});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(title, style: theme.textTheme.bodyLarge)),
        if (trailing != null) ...[const SizedBox(width: 8), trailing!],
      ],
    );
  }
}
