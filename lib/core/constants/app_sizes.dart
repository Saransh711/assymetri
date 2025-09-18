class AppSizes {

  static const double mobileMaxWidth = 768;
  static const double tabletMaxWidth = 1024;
  static const double desktopMinWidth = 1025;
  

  static const double spacingXs = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXl = 32.0;
  static const double spacingXxl = 48.0;
  

  static const double paddingXs = 4.0;
  static const double paddingS = 8.0;
  static const double paddingM = 16.0;
  static const double paddingL = 24.0;
  static const double paddingXl = 32.0;
  

  static const double marginXs = 4.0;
  static const double marginS = 8.0;
  static const double marginM = 16.0;
  static const double marginL = 24.0;
  static const double marginXl = 32.0;
  

  static const double radiusXs = 4.0;
  static const double radiusS = 8.0;
  static const double radiusM = 12.0;
  static const double radiusL = 16.0;
  static const double radiusXl = 24.0;
  

  static const double iconXs = 16.0;
  static const double iconS = 20.0;
  static const double iconM = 24.0;
  static const double iconL = 32.0;
  static const double iconXl = 48.0;
  

  static const double fontXs = 12.0;
  static const double fontS = 14.0;
  static const double fontM = 16.0;
  static const double fontL = 18.0;
  static const double fontXl = 24.0;
  static const double fontXxl = 32.0;
  

  static const double containerMinHeight = 60.0;
  static const double containerMaxHeight = 200.0;
  static const double imageContainerHeight = 100.0;
  static const double sliderHeight = 20.0;
  

  static const double buttonHeight = 48.0;
  static const double buttonMinWidth = 120.0;
  

  static const double appBarHeight = 56.0;
  

  static double getResponsivePadding(double screenWidth) {
    if (screenWidth < mobileMaxWidth) {
      return paddingM;
    } else if (screenWidth < tabletMaxWidth) {
      return paddingL;
    } else {
      return paddingXl;
    }
  }
  
  static double getResponsiveFontSize(double screenWidth, double baseFontSize) {
    if (screenWidth < mobileMaxWidth) {
      return baseFontSize;
    } else if (screenWidth < tabletMaxWidth) {
      return baseFontSize * 1.1;
    } else {
      return baseFontSize * 1.2;
    }
  }
  
  static double getResponsiveImageHeight(double screenWidth) {
    if (screenWidth < mobileMaxWidth) {
      return imageContainerHeight;
    } else if (screenWidth < tabletMaxWidth) {
      return imageContainerHeight * 1.2;
    } else {
      return imageContainerHeight * 1.5;
    }
  }
}
