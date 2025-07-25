import 'package:flutter/material.dart';
import 'custom_slider_thumb_shape.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF020817),
      fontFamily: 'Inter',
      textTheme: _textTheme(Brightness.dark),
      colorScheme: const ColorScheme.dark(
        surface: Color(0xFF020817),
        primary: Color(0xFF3B82F6),
        secondary: Color(0xFF1D4ED8),
        error: Color(0xFFEF4444),
        onPrimary: Colors.white,
        onSecondary: Color(0xFFCBD5E1),
        outline: Color(0xFF1E293B),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1E293B),
        foregroundColor: Colors.white,
        elevation: 1,
      ),
      cardColor: const Color(0xFF1E293B),
      dividerColor: const Color(0xFF1E293B),
      cardTheme: _cardTheme(Brightness.dark),
      sliderTheme: _sliderTheme(Brightness.dark),
      switchTheme: _switchTheme(Brightness.dark),
      dropdownMenuTheme: _dropdownMenuTheme(Brightness.dark),
      elevatedButtonTheme: _elevatedButtonTheme(Brightness.dark),
      textButtonTheme: _textButtonTheme(Brightness.dark),
      outlinedButtonTheme: _outlinedButtonTheme(Brightness.dark),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Inter',
      textTheme: _textTheme(Brightness.light),
      colorScheme: const ColorScheme.light(
        surface: Colors.white,
        primary: Color(0xFF2563EB),
        secondary: Color(0xFF1E40AF),
        error: Color(0xFFDC2626),
        onPrimary: Colors.white,
        onSecondary: Color(0xFF475569),
        outline: Color(0xFFE2E8F0),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Color(0xFF0F172A),
        elevation: 1,
      ),
      cardColor: const Color(0xFFF8FAFC),
      dividerColor: const Color(0xFF1E293B),
      cardTheme: _cardTheme(Brightness.light),
      sliderTheme: _sliderTheme(Brightness.light),
      switchTheme: _switchTheme(Brightness.light),
      dropdownMenuTheme: _dropdownMenuTheme(Brightness.light),
      elevatedButtonTheme: _elevatedButtonTheme(Brightness.light),
      textButtonTheme: _textButtonTheme(Brightness.light),
      outlinedButtonTheme: _outlinedButtonTheme(Brightness.light),
    );
  }

  static CardThemeData _cardTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    return CardThemeData(
      elevation: 0,
      margin: const EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0),
          width: 0.8,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: isDark ? const Color(0xFF1E293B) : Colors.white,
    );
  }

  static SliderThemeData _sliderTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final activeTrackColor = isDark
        ? const Color(0xFF3B82F6)
        : const Color(0xFF2563EB);
    final inactiveTrackColor = isDark
        ? const Color(0xFF475569)
        : const Color(0xFFCBD5E1);

    return SliderThemeData(
      trackHeight: 4.0,
      activeTrackColor: activeTrackColor,
      inactiveTrackColor: inactiveTrackColor,
      thumbColor: isDark ? const Color(0xFF020817) : Colors.white,
      thumbShape: CustomSliderThumbShape(
        thumbRadius: 12.0,
        thumbColor: isDark ? const Color(0xFF020817) : Colors.white,
        borderColor: activeTrackColor,
        borderWidth: 2.0,
      ),
      overlayColor: activeTrackColor.withValues(alpha: 0.1),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 20.0),
      valueIndicatorColor: activeTrackColor,
      valueIndicatorTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      trackShape: const RoundedRectSliderTrackShape(),
    );
  }

  static SwitchThemeData _switchTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final activeTrackColor = isDark
        ? const Color(0xFF3B82F6)
        : const Color(0xFF2563EB);
    final inactiveTrackColor = isDark
        ? const Color(0xFF475569)
        : const Color(0xFFCBD5E1);
    final thumbColor = isDark ? const Color(0xFF020817) : Colors.white;

    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return thumbColor;
        }
        return thumbColor;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return activeTrackColor;
        }
        return inactiveTrackColor;
      }),
      trackOutlineColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return activeTrackColor;
        }
        return inactiveTrackColor;
      }),
      overlayColor: WidgetStateProperty.all(
        activeTrackColor.withValues(alpha: 0.1),
      ),
      splashRadius: 20.0,
      thumbIcon: WidgetStateProperty.all(null),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  static DropdownMenuThemeData _dropdownMenuTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;

    final lightBorderColor = const Color(0xFFE2E8F0);
    final darkBorderColor = const Color(0xFF1E293B);
    final lightBgColor = Colors.white;
    final darkBgColor = const Color(0xFF020817);

    return DropdownMenuThemeData(
      textStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: isDark ? Colors.white : Colors.black,
      ),

      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.all(
          isDark ? darkBgColor : lightBgColor,
        ),
        elevation: WidgetStateProperty.all(1),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),

            side: BorderSide(
              color: isDark ? darkBorderColor : lightBorderColor,
              width: 1.0,
            ),
          ),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(vertical: 4),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isDark ? darkBgColor : lightBgColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: isDark ? darkBorderColor : lightBorderColor,
            width: 1.0,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: isDark ? const Color(0xFF3B82F6) : const Color(0xFF2563EB),
            width: 1.5,
          ),
        ),
      ),
    );
  }

  static TextTheme _textTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    return TextTheme(
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        height: 28 / 18,
        color: isDark ? Colors.white : const Color(0xFF0F172A),
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 28 / 18,
        color: isDark ? Colors.white : const Color(0xFF0F172A),
      ),
      headlineSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        height: 28 / 18,
        color: isDark ? Colors.white : const Color(0xFF0F172A),
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 24 / 16,
        color: isDark ? Colors.white : const Color(0xFF0F172A),
      ),
      bodyLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 20 / 14,
        color: isDark ? Colors.white : const Color(0xFF0F172A),
      ),
      bodyMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 16 / 12,
        color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
      ),
      bodySmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        height: 16 / 11,
        color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 20 / 14,
        color: isDark ? Colors.white : const Color(0xFF0F172A),
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 16 / 12,
        color: isDark ? Colors.white : const Color(0xFF0F172A),
      ),
      labelSmall: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        height: 16 / 11,
      ),
    );
  }

  static ElevatedButtonThemeData _elevatedButtonTheme(Brightness brightness) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2563EB),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    );
  }

  static TextButtonThemeData _textButtonTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: isDark
            ? const Color(0xFFCBD5E1)
            : const Color(0xFF475569),
        textStyle: const TextStyle(fontSize: 14),
      ),
    );
  }

  static OutlinedButtonThemeData _outlinedButtonTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: isDark
            ? const Color(0xFF334155)
            : const Color(0xFFE2E8F0),
        foregroundColor: isDark ? Colors.white : const Color(0xFF0F172A),
        side: BorderSide(
          color: isDark ? const Color(0xFF475569) : const Color(0xFFCBD5E1),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    );
  }
}
