import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:payment_app/src/features/payment_feature/data_layer/data_source/remote_data_source.dart';
import 'package:payment_app/src/features/payment_feature/data_layer/repository/payment_repository_impl.dart';
import 'package:payment_app/src/features/payment_feature/domain_layer/usecases/auth_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/errors/failures_handling.dart';
import 'core/network_info/cache_info.dart';
import 'core/network_info/internet_checker_info.dart';
import 'features/payment_feature/domain_layer/repository/payment_repository.dart';
import 'features/payment_feature/domain_layer/usecases/get_payment_key_use_case.dart';
import 'features/payment_feature/domain_layer/usecases/order_registration_use_case.dart';
import 'utils/constants/api_constants.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  ///Blocs

  ///UseCases
  sl.registerLazySingleton(() => AuthUseCase(repository: sl()));
  sl.registerLazySingleton(() => OrderRegistrationUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetPaymentKeyUseCase(repository: sl()));
  // sl.registerLazySingleton(() => AuthUseCase(repository: sl()));

  ///Repositories
  sl.registerLazySingleton<PaymentRepository>(() => PaymentRepositoryImpl(
      remoteDataSource: sl(), cacheInfo: sl(), internetCheckerInfo: sl()));

  ///DataSources
  sl.registerLazySingleton<PaymentRemoteDataSource>(
      () => PaymentRemoteDataSourceImplWithDio(dio: sl()));

  ///Core
  sl.registerLazySingleton<InternetCheckerInfo>(
      () => InternetCheckerInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton(() => FailuresHandling());
  sl.registerLazySingleton<CacheInfo>(
      () => CacheInfoImplWithPreferences(preferences: sl()));

  ///External
  sl.registerLazySingleton(() => Dio(BaseOptions(
      baseUrl: baseUrl, headers: {'Content-Type': 'application/json'})));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  SharedPreferences preferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => preferences);
}
