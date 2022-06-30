import 'package:flutter_hsc/app/domain/entities/weather_obj.dart';
import 'package:flutter_hsc/app/domain/repositories/weather_repository.dart';
import 'package:flutter_hsc/core/error/error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_hsc/core/use_case/param.dart';
import 'package:flutter_hsc/core/use_case/use_case.dart';

class GetWeatherUseCase implements UseCase<void, WeatherParam> {
  final WeatherRepository repository;
  GetWeatherUseCase(this.repository);

  @override
  Future<Either<Failure, WeatherEntity>> call(WeatherParam params) async {
    return await repository.getWeather(params.lat, params.lon, params.locale);
  }
}
