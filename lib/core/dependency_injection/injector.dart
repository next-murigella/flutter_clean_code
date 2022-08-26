import 'package:flutter/material.dart';
import 'package:flutter_hsc/app/data/data_sources/api_impl.dart';
import 'package:flutter_hsc/app/data/repositories/weather_repository_impl.dart';
import 'package:flutter_hsc/app/domain/repositories/weather_repository.dart';
import 'package:flutter_hsc/app/presentation/stores/main_view_store.dart';
import 'package:flutter_hsc/core/data/secured_storage.dart';
import 'package:flutter_hsc/flavor_config.dart';
import 'package:get_it/get_it.dart';

import '../../app/domain/use_case/get_weather_use_case.dart';

final injector = GetIt.instance;

void init() {
  // Stores
  injector.registerLazySingleton(() => MainViewStore());

  // Repositories
  injector.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImplementation());

  // Use cases
  injector.registerLazySingleton(() => GetWeatherUseCase(injector()));

  // Flavouring
  injector.registerLazySingleton(() => FlavorConfig());

  // Data sources
  injector.registerLazySingleton(() => MockAPI());
  injector.registerLazySingleton(() => SecuredStorageHandler());
}

void initConfig(
    {required Color color,
    required Flavor flavor,
    required FlavorValues values}) {
  SecuredStorageHandler securedStorageHandler =
      injector<SecuredStorageHandler>();
  SecuredStorageItem apiKey =
      SecuredStorageItem("api_key", "74a98c567b3ed77e5bee777edfdaaf1a");
  securedStorageHandler.writeSecureData(apiKey);
  FlavorConfig flavorConfig = injector<FlavorConfig>();
  flavorConfig.color = color;
  flavorConfig.flavor = flavor;
  flavorConfig.name = flavor.name;
  flavorConfig.values = values;
}
