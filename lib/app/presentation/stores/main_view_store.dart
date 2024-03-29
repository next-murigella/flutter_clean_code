import 'package:flutter_hsc/app/domain/entities/weather_obj.dart';
import 'package:flutter_hsc/core/dependency_injection/injector.dart';
import 'package:flutter_hsc/core/use_case/param.dart';
import 'package:mobx/mobx.dart';

import '../../domain/use_case/get_weather_use_case.dart';

part 'main_view_store.g.dart';

class MainViewStore = _MainViewStore with _$MainViewStore;

abstract class _MainViewStore with Store {
  final GetWeatherUseCase _getWeatherUseCase = injector<GetWeatherUseCase>();

  @observable
  late String postalCode = "";

  String countryCode = "de";

  String unit = "metric";

  @observable
  WeatherEntity? weather;

  @observable
  MainViewState mainViewState = MainViewState.startup;

  @action
  Future fetchWeather(String postalCode, String locale) async {
    mainViewState = MainViewState.loading;
    var result = await _getWeatherUseCase(
        WeatherParam(postalCode, countryCode, locale, unit));
    result.fold((l) => null, (r) => weather = r);
    mainViewState = MainViewState.loaded;
  }
}

enum MainViewState { loading, empty, error, loaded, startup }
