import '../models/app_config_model.dart';

abstract class LocalDataSource {
  AppConfigModel getAppConfig();
  void saveAppConfig(AppConfigModel config);
}

class LocalDataSourceImpl implements LocalDataSource {
  AppConfigModel? _cachedConfig;

  @override
  AppConfigModel getAppConfig() {
    return _cachedConfig ?? AppConfigModel(
      selectedColor: 'Green',
      animationSpeed: 0.5,
      totalItems: 10,
      itemsInLine: 5,
      isReversed: false,
      progressValue: 0.0,
    );
  }

  @override
  void saveAppConfig(AppConfigModel config) {
    _cachedConfig = config;
  }
}
