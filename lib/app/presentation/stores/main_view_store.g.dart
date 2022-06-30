// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_view_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainViewStore on _MainViewStore, Store {
  late final _$weatherAtom =
      Atom(name: '_MainViewStore.weather', context: context);

  @override
  WeatherEntity? get weather {
    _$weatherAtom.reportRead();
    return super.weather;
  }

  @override
  set weather(WeatherEntity? value) {
    _$weatherAtom.reportWrite(value, super.weather, () {
      super.weather = value;
    });
  }

  late final _$mainViewStateAtom =
      Atom(name: '_MainViewStore.mainViewState', context: context);

  @override
  MainViewState get mainViewState {
    _$mainViewStateAtom.reportRead();
    return super.mainViewState;
  }

  @override
  set mainViewState(MainViewState value) {
    _$mainViewStateAtom.reportWrite(value, super.mainViewState, () {
      super.mainViewState = value;
    });
  }

  late final _$fetchWeatherAsyncAction =
      AsyncAction('_MainViewStore.fetchWeather', context: context);

  @override
  Future<dynamic> fetchWeather(double lat, double lon, String locale) {
    return _$fetchWeatherAsyncAction
        .run(() => super.fetchWeather(lat, lon, locale));
  }

  @override
  String toString() {
    return '''
weather: ${weather},
mainViewState: ${mainViewState}
    ''';
  }
}
