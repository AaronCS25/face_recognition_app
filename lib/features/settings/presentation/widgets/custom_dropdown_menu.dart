import 'package:flutter/material.dart';

class CustomDropdownMenu<T> extends StatelessWidget {
  final List<DropdownMenuEntry<T>> entries;
  final T? initialSelection;
  final ValueChanged<T?> onSelected;
  final String? label;

  const CustomDropdownMenu({
    super.key,
    required this.entries,
    required this.onSelected,
    this.initialSelection,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) => DropdownMenu<T>(
        width: constraints.maxWidth,
        onSelected: onSelected,
        dropdownMenuEntries: entries,
        initialSelection: initialSelection,
        label: label != null ? Text(label!) : null,
        alignmentOffset: const Offset(0, 4),
        menuStyle: theme.dropdownMenuTheme.menuStyle?.copyWith(
          fixedSize: WidgetStateProperty.all(
            Size(constraints.maxWidth, double.infinity),
          ),
        ),
      ),
    );
  }
}
