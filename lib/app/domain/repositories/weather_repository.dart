import 'package:dartz/dartz.dart';
import 'package:flutter_hsc/app/domain/entities/weather_obj.dart';
import 'package:flutter_hsc/core/error/error.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> getWeather(
      double lat, double lon, String locale);
}
