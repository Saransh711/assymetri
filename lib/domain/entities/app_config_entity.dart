class AppConfigEntity {
  final String selectedColor;
  final double animationSpeed;
  final int totalItems;
  final int itemsInLine;
  final bool isReversed;
  final double progressValue;

  AppConfigEntity({
    required this.selectedColor,
    required this.animationSpeed,
    required this.totalItems,
    required this.itemsInLine,
    required this.isReversed,
    required this.progressValue,
  });
}
