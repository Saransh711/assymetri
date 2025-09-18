import '../../domain/entities/app_config_entity.dart';

class AppConfigModel extends AppConfigEntity {
  AppConfigModel({
    required super.selectedColor,
    required super.animationSpeed,
    required super.totalItems,
    required super.itemsInLine,
    required super.isReversed,
    required super.progressValue,
  });

  factory AppConfigModel.fromJson(Map<String, dynamic> json) {
    return AppConfigModel(
      selectedColor: json['selectedColor'] ?? 'Green',
      animationSpeed: json['animationSpeed']?.toDouble() ?? 0.5,
      totalItems: json['totalItems'] ?? 1,
      itemsInLine: json['itemsInLine'] ?? 1,
      isReversed: json['isReversed'] ?? false,
      progressValue: json['progressValue']?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'selectedColor': selectedColor,
      'animationSpeed': animationSpeed,
      'totalItems': totalItems,
      'itemsInLine': itemsInLine,
      'isReversed': isReversed,
      'progressValue': progressValue,
    };
  }
}
