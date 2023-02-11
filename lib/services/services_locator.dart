


import 'package:get_it/get_it.dart';

import '../data/datasource/remote_datasource.dart';
import '../data/repository/service_category_repository.dart';
import '../domain/repository/base_service_category_repository.dart';
import '../domain/use_cases/get_service_category.dart';
import '../presentation/controller/service_category_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Bloc
      sl.registerFactory(() => ServiceCategoryBloc( sl()));

    /// Use Cases
    sl.registerLazySingleton(() => GetServiceCategoryUseCase(sl()));


    /// Repository
     sl.registerLazySingleton<BaseServiceCategoryRepository>(
       () =>  ServiceCategoryRepository(sl()));



    /// DATA SOURCE
     sl.registerLazySingleton<BaseRemoteDataSource>(
          () => RemoteDataSource());
  }
}
