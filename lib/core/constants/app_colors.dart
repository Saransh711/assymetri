import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF4CAF50);
  static const Color primaryDark = Color(0xFF388E3C);
  static const Color primaryLight = Color(0xFF81C784);

  static const Color secondary = Color(0xFF2196F3);
  static const Color secondaryDark = Color(0xFF1976D2);
  static const Color secondaryLight = Color(0xFF64B5F6);

  static const Color background = Color(0xFFF5F5F5);
  static const Color surface = Colors.white;
  static const Color cardBackground = Colors.white;

  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFF9E9E9E);

  static const Color border = Color(0xFFE0E0E0);
  static const Color divider = Color(0xFFBDBDBD);

  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFF57C00);
  static const Color error = Color(0xFFE53935);
  static const Color info = Color(0xFF1976D2);

  static const Map<String, Color> themeColors = {
    'Green': Color(0xFF4CAF50),
    'Blue': Color(0xFF2196F3),
    'Red': Color(0xFFF44336),
    'Purple': Color(0xFF9C27B0),
  };

  static const List<Color> primaryGradient = [
    Color(0xFF4CAF50),
    Color(0xFF81C784),
  ];

  static const List<Color> secondaryGradient = [
    Color(0xFF2196F3),
    Color(0xFF64B5F6),
  ];
}
