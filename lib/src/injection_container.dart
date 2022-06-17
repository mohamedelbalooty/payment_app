import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'core/errors/failures_handling.dart';
import 'core/network_info/internet_checker_info.dart';
import 'core/network_info/network_info.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  ///Blocs

  ///UseCases

  ///Repositories

  ///DataSources

  ///Core
  sl.registerLazySingleton<InternetCheckerInfo>(
      () => InternetCheckerInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImplWithDio(dio: sl()));
  sl.registerLazySingleton(() => FailuresHandling());

  ///External
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
