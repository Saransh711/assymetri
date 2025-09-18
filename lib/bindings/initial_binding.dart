import 'package:get/get.dart';
import '../data/datasources/local_data_source.dart';
import '../data/repositories/app_config_repository_impl.dart';
import '../domain/repositories/app_config_repository.dart';
import '../domain/usecases/get_app_config_usecase.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalDataSource>(() => LocalDataSourceImpl(), fenix: true);

    Get.lazyPut<AppConfigRepository>(
      () => AppConfigRepositoryImpl(localDataSource: Get.find()),
      fenix: true,
    );

    Get.lazyPut<GetAppConfigUseCase>(
      () => GetAppConfigUseCase(repository: Get.find()),
      fenix: true,
    );
  }
}
