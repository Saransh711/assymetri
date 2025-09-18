import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/app_controller.dart';

class AnimationSpeedSliderWidget extends StatelessWidget {
  const AnimationSpeedSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppController>();

    return Obx(
      () => SizedBox(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Slider(
              min: 0.0,
              max: 2.0,
              divisions: 2,
              value: controller.animationSpeed.value,
              label: _getSpeedLabel(controller.animationSpeed.value),
              onChanged: (v) {
                double snappedValue;
                if (v <= 0.67) {
                  snappedValue = 0.0;
                } else if (v <= 1.33) {
                  snappedValue = 1.0;
                } else {
                  snappedValue = 2.0;
                }
                controller.updateAnimationSpeed(snappedValue);
              },
              activeColor: controller.getSelectedColor(),
              inactiveColor: controller.getSelectedColor().withValues(
                alpha: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getSpeedLabel(double value) {
    if (value <= 0.67) {
      return 'Slow';
    } else if (value <= 1.33) {
      return 'Smooth';
    } else {
      return 'Fast';
    }
  }
}
