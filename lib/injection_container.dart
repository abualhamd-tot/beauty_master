import 'package:beauty_master/data/repos/products_repo.dart';
import 'package:beauty_master/domain/repos/products_repo.dart';
import 'package:beauty_master/view/blocs/bloc/products_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/external_dependencies/shared_prefs.dart';
import 'core/network/api/api_consumer.dart';
import 'core/network/api/app_interceptors.dart';
import 'core/network/api/dio_consumer.dart';
import 'data/datasources/products_datasource.dart';

final getIt = GetIt.instance;

Future init() async {
  //? blocs
  getIt.registerLazySingleton(() => ProductsBloc(productsRepo: getIt()));

  //? usecases

  //? repos
  getIt.registerLazySingleton<ProductsRepo>(
      () => ProductsRepoImpl(productsDatasource: getIt()));

  //? data sources
  getIt.registerLazySingleton<ProductsDatasource>(
      () => ProductsDatasourceImpl(apiConsumer: getIt()));

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
