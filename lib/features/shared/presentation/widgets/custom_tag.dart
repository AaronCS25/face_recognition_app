import 'package:flutter/material.dart';

enum TagType { primary, secondary, tertiary }

class CustomTag extends StatelessWidget {
  final String label;
  final TagType type;

  const CustomTag({super.key, required this.label, required this.type});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final config = _getTagConfig(type, theme);

    return Container(
      decoration: config.decoration,
      padding: config.padding,
      child: Text(label, style: config.textStyle),
    );
  }

  _TagConfig _getTagConfig(TagType type, ThemeData theme) {
    const padding = EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0);

    final textStyle = theme.textTheme.labelMedium?.copyWith(
      fontWeight: FontWeight.w600,
      color: theme.colorScheme.onPrimary,
    );

    switch (type) {
      case TagType.primary:
        return _TagConfig(
          padding: padding,
          textStyle: textStyle,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(12.0),
          ),
        );
      case TagType.secondary:
        return _TagConfig(
          padding: padding,
          textStyle: textStyle,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: theme.dividerColor),
            borderRadius: BorderRadius.circular(12.0),
          ),
        );
      case TagType.tertiary:
        return _TagConfig(
          padding: padding,
          textStyle: textStyle,
          decoration: BoxDecoration(
            color: const Color(0xFF334155),
            borderRadius: BorderRadius.circular(12.0),
          ),
        );
    }
  }
}

class _TagConfig {
  final BoxDecoration decoration;
  final EdgeInsetsGeometry padding;
  final TextStyle? textStyle;

  _TagConfig({
    required this.decoration,
    required this.padding,
    required this.textStyle,
  });
}
