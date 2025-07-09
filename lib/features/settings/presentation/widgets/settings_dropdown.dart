import 'package:flutter/material.dart';
import 'custom_dropdown_menu.dart';

class SettingsDropdown extends StatelessWidget {
  final String title;
  final String subtitle;
  final String initialSelection;
  final ValueChanged<String?> onSelected;
  final List<DropdownMenuEntry<String>> entries;

  const SettingsDropdown({
    super.key,
    required this.title,
    required this.subtitle,
    required this.initialSelection,
    required this.entries,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Data Retention Period", style: theme.textTheme.bodyLarge),
        const SizedBox(height: 12),
        Text(
          "How long to keep recognition data",
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 12),

        CustomDropdownMenu(
          initialSelection: initialSelection,
          onSelected: onSelected,
          entries: entries,
        ),
      ],
    );
  }
}
