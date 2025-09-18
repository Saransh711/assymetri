import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../../core/utils/responsive_helper.dart';
import '../widgets/animation_speed_slider_widget.dart';
import '../widgets/asymmetri_image_widget.dart';
import '../widgets/color_dropdown_widget.dart';
import '../widgets/items_in_line_slider_widget.dart';
import '../widgets/progress_slider_widget.dart';
import '../widgets/reverse_toggle_widget.dart';
import '../widgets/total_items_slider_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Container(
            width: ResponsiveHelper.getMaxContentWidth(context),
            padding: ResponsiveHelper.getResponsivePadding(context),
            child: SingleChildScrollView(
              child: _buildResponsiveLayout(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResponsiveLayout(BuildContext context) {
    if (ResponsiveHelper.isDesktop(context)) {
      return _buildDesktopLayout();
    } else if (ResponsiveHelper.isTablet(context)) {
      return _buildTabletLayout();
    } else {
      return _buildMobileLayout();
    }
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        AsymmetriImageWidget(),
        _buildSpacing(),
        ColorDropdownWidget(),
        _buildSpacing(),
        AnimationSpeedSliderWidget(),
        _buildSpacing(),
        TotalItemsSliderWidget(),
        _buildSpacing(),
        ItemsInLineSliderWidget(),
        _buildSpacing(),
        ReverseToggleWidget(),
        _buildSpacing(),
        ProgressSliderWidget(),
      ],
    );
  }

  Widget _buildTabletLayout() {
    return Column(
      children: [
         AsymmetriImageWidget(),
        _buildSpacing(),
        ColorDropdownWidget(),
        _buildSpacing(),
        AnimationSpeedSliderWidget(),
        _buildSpacing(),
        TotalItemsSliderWidget(),
        _buildSpacing(),
        ItemsInLineSliderWidget(),
        _buildSpacing(),
        ReverseToggleWidget(),
        _buildSpacing(),
        ProgressSliderWidget(),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Column(
      children: [
        AsymmetriImageWidget(),
        _buildSpacing(),
        ColorDropdownWidget(),
        _buildSpacing(),
        AnimationSpeedSliderWidget(),
        _buildSpacing(),
        TotalItemsSliderWidget(),
        _buildSpacing(),
        ItemsInLineSliderWidget(),
        _buildSpacing(),
        ReverseToggleWidget(),
        _buildSpacing(),
        ProgressSliderWidget(),
      ],
    );
  }

  Widget _buildSpacing({bool large = false}) {
    return SizedBox(height: large ? AppSizes.spacingL : AppSizes.spacingM);
  }
}
