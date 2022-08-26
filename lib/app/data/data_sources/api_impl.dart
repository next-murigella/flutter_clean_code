import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_hsc/app/data/models/weather_obj_model.dart';
import 'package:flutter_hsc/core/data/api.dart';
import 'package:flutter_hsc/core/data/secured_storage.dart';
import 'package:flutter_hsc/core/dependency_injection/injector.dart';
import 'package:flutter_hsc/flavor_config.dart';

class MockAPI implements API {
  final String weatherPath = "/data/2.5/weather";
  final String parkinglotStatusPath = "/api/v1/parkinglot-status/current/";
  final flavorConfig = injector<FlavorConfig>();
  final securedStorageHandler = injector<SecuredStorageHandler>();
  String? apiKey;
  Dio? dio;

  MockAPI() {
    dio = Dio(BaseOptions(
        baseUrl: flavorConfig.values!.weatherUrl,
        connectTimeout: 10000,
        sendTimeout: 10000));
  }

  Future initKey() async {
    apiKey = await securedStorageHandler.readSecureData('api_key');
  }

  @override
  Future getWeather(
      String postalCode, String countryCode, String locale, String unit) async {
    await initKey();
    var queryParameters = {
      'units': unit,
      'zip': postalCode + "," + countryCode,
      'lang': locale,
      'appid': apiKey
    };
    Uri newUri = Uri(
        scheme: 'https',
        host: "api.openweathermap.org",
        path: weatherPath,
        queryParameters: queryParameters);

    var response = await dio?.getUri(newUri);
    if (response?.statusCode == 200) {
      return WeatherModel.fromJson(response?.data);
    } else {
      if (kDebugMode) {
        print(response?.statusCode);
      }
    }
  }
}
