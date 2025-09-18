import 'package:flutter/material.dart';
import 'app_colors.dart';

class MyData {
  static const String asymmetriImageUrl = 
      'https://tinyurl.com/3hfa26cx';

  static const Map<String, Color> colorOptions = AppColors.themeColors;

  static const List<String> speedLabels = [
    'Very Slow',
    'Slow',
    'Normal',
    'Fast',
    'Very Fast',
  ];

  static const double minAnimationSpeed = 0.1;
  static const double maxAnimationSpeed = 2.0;
  static const int maxTotalItems = 15;
  static const int maxItemsInLine = 15;
  
 
  static const double mobileBreakpoint = 768;
  static const double tabletBreakpoint = 1024;
  

  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 400);
  static const Duration longAnimation = Duration(milliseconds: 600);
}
