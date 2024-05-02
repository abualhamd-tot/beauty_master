import 'package:beauty_master/data/datasources/services_datasouce.dart';
import 'package:beauty_master/data/repos/products_repo.dart';
import 'package:beauty_master/domain/repos/products_repo.dart';
import 'package:beauty_master/view/blocs/products/products_bloc.dart';
import 'package:beauty_master/view/blocs/services/services_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/external_dependencies/shared_prefs.dart';
import 'core/network/api/api_consumer.dart';
import 'core/network/api/app_interceptors.dart';
import 'core/network/api/dio_consumer.dart';
import 'data/datasources/products_datasource.dart';
import 'data/repos/services_repo_impl.dart';
import 'domain/repos/services_repo.dart';

final getIt = GetIt.instance;

Future init() async {
  //? blocs
  getIt.registerLazySingleton(() => ProductsBloc(productsRepo: getIt()));
  getIt.registerLazySingleton(() => ServicesBloc(servicesRepo: getIt()));

  //? usecases

  //? repos
  getIt.registerLazySingleton<ProductsRepo>(
      () => ProductsRepoImpl(productsDatasource: getIt()));
  getIt.registerLazySingleton<ServicesRepo>(
      () => ServicesRepoImpl(serviceDatasource: getIt()));

  //? data sources
  getIt.registerLazySingleton<ProductsDatasource>(
      () => ProductsDatasourceImpl(apiConsumer: getIt()));
  getIt.registerLazySingleton<ServicesDatasource>(
      () => ServicesDatasourceImpl(apiConsumer: getIt()));

  //? core
  getIt.registerLazySingleton<ApiConsumer>(
      () => DioConsumer(client: getIt(), interceptors: [
            getIt<AppInterceptors>(),
            if (kDebugMode) getIt<LogInterceptor>(),
          ]));

  //? external
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPrefs>(
      () => SharedPrefsImpl(sharedPreferences: sharedPreferences));
  getIt.registerLazySingleton(() => AppInterceptors());
  getIt.registerLazySingleton(() => LogInterceptor(
        requestBody: true,
        responseBody: true,
      ));
  getIt.registerLazySingleton(() => Dio());
}
