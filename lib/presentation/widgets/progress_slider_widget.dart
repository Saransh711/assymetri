import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/my_functions.dart';
import '../controllers/app_controller.dart';

class ProgressSliderWidget extends StatelessWidget {
  const ProgressSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppController>();
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Container()),
              Expanded(flex: 2, child: _buildProgressGrid(controller)),
              Expanded(child: Container()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressGrid(AppController controller) {
    final totalItems = controller.totalItems.value;
    final itemsInLine = controller.itemsInLine.value;
    final baseColor = controller.getSelectedColor();
    final rows = (totalItems / itemsInLine).ceil();

    List<Widget> rowWidgets = [];

    for (int row = 0; row < rows; row++) {
      List<Widget> rowItems = [];
      final startIndex = row * itemsInLine;
      final endIndex = (startIndex + itemsInLine).clamp(0, totalItems);

      for (int i = startIndex; i < endIndex; i++) {
        rowItems.add(
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              child: _buildSingleProgressBar(controller, baseColor, i),
            ),
          ),
        );
      }

      while (rowItems.length < itemsInLine) {
        rowItems.add(
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              height: 20,
            ),
          ),
        );
      }

      rowWidgets.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Row(children: rowItems),
        ),
      );
    }

    return Column(children: rowWidgets);
  }

  Widget _buildSingleProgressBar(
    AppController controller,
    Color baseColor,
    int index,
  ) {
    return Container(
      height: 20,
      decoration: BoxDecoration(
        color: Colors.grey[220],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) => Obx(() {
          final progressValue = index < controller.progressValues.length
              ? controller.progressValues[index]
              : 0.0;

          return Align(
            alignment: controller.isReversed.value
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Container(
              width: constraints.maxWidth * progressValue,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: MyFunctions.getProgressGradient(baseColor),
              ),
            ),
          );
        }),
      ),
    );
  }
}
