import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../network_info/network_info.dart';

final getIt = GetIt.instance;

void setupServiceLocator()
{
  // Register services
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  // Register use cases
  // getIt.registerLazySingleton<GetRandomNumber>(() => GetRandomNumber(getIt()));

  // Register repositories
  // getIt.registerLazySingleton<NumberTriviaRepository>(() => NumberTriviaRepositoryImpl(getIt()));

  // Register data sources
  // getIt.registerLazySingleton<NumberTriviaRemoteDataSource>(() => NumberTriviaRemoteDataSourceImpl(getIt()));
  // getIt.registerLazySingleton<NumberTriviaLocalDataSource>(() => NumberTriviaLocalDataSourceImpl(getIt()));

  // Register core
  // getIt.registerLazySingleton<InputConverter>(() => InputConverter());
  // getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  // Register external
  // getIt.registerLazySingleton(() => http.Client());
  getIt.registerLazySingleton(() => InternetConnectionChecker());
}
