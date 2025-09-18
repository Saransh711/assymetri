import 'package:flutter/material.dart';
import '../../core/constants/my_data.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/utils/responsive_helper.dart';

class AsymmetriImageWidget extends StatelessWidget {
  const AsymmetriImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final imageHeight = ResponsiveHelper.getResponsiveHeight(
      context,
      mobile: AppSizes.imageContainerHeight,
      tablet: AppSizes.imageContainerHeight * 1.2,
      desktop: AppSizes.imageContainerHeight * 1.5,
    );

    final fontSize = ResponsiveHelper.getResponsiveFontSize(
      context,
      AppSizes.fontXl,
    );

    return Container(
      width: 300,
      height: imageHeight,
      decoration: BoxDecoration(
        color: AppColors.textPrimary,
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
        child: Image.network(
          MyData.asymmetriImageUrl,
          height: imageHeight * 0.6,
          fit: BoxFit.cover, 
          errorBuilder: (context, error, stackTrace) {
            return Center(
              child: Text(
                'Asymmetri',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
