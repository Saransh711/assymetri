import '../entities/app_config_entity.dart';
import '../repositories/app_config_repository.dart';

class GetAppConfigUseCase {
  final AppConfigRepository repository;

  GetAppConfigUseCase({required this.repository});

  AppConfigEntity call() {
    return repository.getAppConfig();
  }
}
