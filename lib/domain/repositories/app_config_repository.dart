import '../entities/app_config_entity.dart';

abstract class AppConfigRepository {
  AppConfigEntity getAppConfig();
  void saveAppConfig(AppConfigEntity config);
}
