import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/app_strings.dart';
import '../controllers/app_controller.dart';

class ReverseToggleWidget extends StatelessWidget {
  const ReverseToggleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppController>();
    return Obx(
      () => SizedBox(
        width: 300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppStrings.reverse ,style: TextStyle(
              fontSize: 16,
              color: controller.getSelectedColor(),
              fontWeight: FontWeight.bold
            ),),
            Switch(
              value: controller.isReversed.value,
              activeThumbColor: controller.getSelectedColor(),
              activeTrackColor: controller.getSelectedLightColor(),
              onChanged: (v) => controller.toggleReverse(v),
            ),
          ],
        ),
      ),
    );
  }
}
