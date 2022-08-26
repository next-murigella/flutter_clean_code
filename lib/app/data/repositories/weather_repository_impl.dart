import 'package:flutter_hsc/app/data/data_sources/api_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_hsc/app/domain/entities/weather_obj.dart';

import 'package:flutter_hsc/app/domain/repositories/weather_repository.dart';
import 'package:flutter_hsc/core/data/api.dart';
import 'package:flutter_hsc/core/dependency_injection/injector.dart';
import 'package:flutter_hsc/core/error/error.dart';
import 'package:flutter_hsc/flavor_config.dart';
import 'package:flutter/foundation.dart';

class WeatherRepositoryImplementation implements WeatherRepository {
  final flavorConfig = injector<FlavorConfig>();
  API? dataSource;

  WeatherRepositoryImplementation() {
    switch (flavorConfig.flavor!) {
      case Flavor.PRODUCTION:
        dataSource = injector<MockAPI>();
        break;
      case Flavor.DEV:
        dataSource = injector<MockAPI>();
        break;
      case Flavor.MOCK:
        dataSource = injector<MockAPI>();
        break;
    }
  }

  @override
  Future<Either<Failure, WeatherEntity>> getWeather(
      String postalCode, String countryCode, String locale, String unit) async {
    try {
      return Right(
          await dataSource?.getWeather(postalCode, countryCode, locale, unit));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Future.value(Left(ServerFailure()));
    }
  }
}
