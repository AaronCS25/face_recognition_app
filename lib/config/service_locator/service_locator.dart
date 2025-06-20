import 'package:get_it/get_it.dart';
import 'package:cvpr_face_recognition/features/individuals/individuals.dart';

class ServiceLocator {
  static final _getIt = GetIt.instance;

  static T get<T extends Object>() => _getIt.get<T>();

  static Future<void> init() async {
    _getIt.registerLazySingleton<ProfileRepositoryImpl>(
      () => ProfileRepositoryImpl(datasource: LocalProfileDatasourceImpl()),
    );
  }
}
