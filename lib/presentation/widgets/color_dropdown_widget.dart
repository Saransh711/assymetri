import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/app_colors.dart';
import '../controllers/app_controller.dart';

class ColorDropdownWidget extends StatelessWidget {
  const ColorDropdownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppController>();
    return Obx(
      () => Container(
        width: 300,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: controller.selectedColor.value,
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.textSecondary,
            ),
            isExpanded: true,
            items: AppColors.themeColors.keys.map((color) {
              return DropdownMenuItem<String>(
                value: color,
                child: Text(
                  color,
                  style: TextStyle(
                    color: AppColors.themeColors[color],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }).toList(),
            onChanged: (val) {
              if (val != null) controller.updateColor(val);
            },
          ),
        ),
      ),
    );
  }
}
