import 'package:flutter/material.dart';
import '../constants/app_strings.dart';

class MyFunctions {
  static String getSpeedLabel(double speed) {
    if (speed <= 0.3) return AppStrings.verySlow;
    if (speed <= 0.7) return AppStrings.slow;
    if (speed <= 1.2) return AppStrings.normal;
    if (speed <= 1.7) return AppStrings.fast;
    return AppStrings.veryFast;
  }

  static LinearGradient getProgressGradient(Color baseColor) {
    final dark = baseColor.withValues(alpha:0.9);
    final mid = baseColor.withValues(alpha:0.7);
    final light = baseColor.withValues(alpha:0.4);
    return LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [light, mid, baseColor, dark],
      stops: const [0.0, 0.5, 0.85, 1.0],
    );
  }
}
