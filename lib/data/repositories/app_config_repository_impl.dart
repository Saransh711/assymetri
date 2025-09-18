import '../../domain/entities/app_config_entity.dart';
import '../../domain/repositories/app_config_repository.dart';
import '../datasources/local_data_source.dart';
import '../models/app_config_model.dart';

class AppConfigRepositoryImpl implements AppConfigRepository {
  final LocalDataSource localDataSource;

  AppConfigRepositoryImpl({required this.localDataSource});

  @override
  AppConfigEntity getAppConfig() {
    return localDataSource.getAppConfig();
  }

  @override
  void saveAppConfig(AppConfigEntity config) {
    final model = AppConfigModel(
      selectedColor: config.selectedColor,
      animationSpeed: config.animationSpeed,
      totalItems: config.totalItems,
      itemsInLine: config.itemsInLine,
      isReversed: config.isReversed,
      progressValue: config.progressValue,
    );
    localDataSource.saveAppConfig(model);
  }
}
