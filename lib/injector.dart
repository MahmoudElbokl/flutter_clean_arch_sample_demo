import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'src/core/api_provider.dart';
import 'src/core/connection_info.dart';
import 'src/features/news/data/data_source/get_news_local_data_source.dart';
import 'src/features/news/data/data_source/get_news_remote_data_source.dart';
import 'src/features/news/data/repositories/get_news_repo_impl.dart';
import 'src/features/news/domain/repositories/get_news_repo.dart';
import 'src/features/news/domain/use_cases/get_news_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Use cases
  sl.registerLazySingleton(() => GetNewsUseCases(sl()));

  // Repository
  sl.registerLazySingleton<GetNewsRepository>(
    () => GetNewsRepositoryImpl(sl(), sl(), sl()),
  );

  // Data sources
  sl.registerLazySingleton<GetNewsRemoteDataSource>(
    () => GetNewsRemoteDataSourceImpl(apiProvider: sl()),
  );
  sl.registerLazySingleton<GetNewsLocalDataSource>(
    () => GetNewsLocalDataSourceImpl(localStorage: sl()),
  );

  //! Core
  sl.registerLazySingleton<ApiProvider>(
    () => ApiProvider(),
  );
  await GetStorage.init();
  sl.registerLazySingleton<ConnectionInfo>(() => ConnectionInfoImpl(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => GetStorage());
}
