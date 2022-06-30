import 'package:flutter_hsc/app/domain/entities/weather_obj.dart';
import 'package:flutter_hsc/app/domain/use_case/get_parkinglot_use_case.dart';
import 'package:flutter_hsc/core/dependency_injection/injector.dart';
import 'package:flutter_hsc/core/use_case/param.dart';
import 'package:mobx/mobx.dart';

part 'main_view_store.g.dart';

class MainViewStore = _MainViewStore with _$MainViewStore;

abstract class _MainViewStore with Store {
  final GetWeatherUseCase _getWeatherUseCase = injector<GetWeatherUseCase>();

  @observable
  late double lat;

  @observable
  late double lon;

  @observable
  WeatherEntity? weather;

  @observable
  MainViewState mainViewState = MainViewState.startup;

  @action
  Future fetchWeather(double lat, double lon, String locale) async {
    mainViewState = MainViewState.loading;
    var result = await _getWeatherUseCase(WeatherParam(lat, lon, locale));
    result.fold((l) => null, (r) => weather = r);
    mainViewState = MainViewState.loaded;
  }
}

enum MainViewState { loading, empty, error, loaded, startup }
