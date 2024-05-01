import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/external_dependencies/shared_prefs.dart';
import 'core/network/api/api_consumer.dart';
import 'core/network/api/app_interceptors.dart';
import 'core/network/api/dio_consumer.dart';

final sl = GetIt.instance;

Future init() async {
  //? usecases

  //? repos

  //? data sources

  //? core
  sl.registerLazySingleton<ApiConsumer>(
      () => DioConsumer(client: sl(), interceptors: [
            sl<AppInterceptors>(),
            if (kDebugMode) sl<LogInterceptor>(),
          ]));

  //? external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPrefs>(
      () => SharedPrefsImpl(sharedPreferences: sharedPreferences));
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
        requestBody: true,
        responseBody: true,
      ));
  sl.registerLazySingleton(() => Dio());
}
