import 'package:equatable/equatable.dart';

class WeatherParam extends Equatable {
  final double lat;
  final double lon;
  final String locale;

  const WeatherParam(this.lat, this.lon, this.locale);

  @override
  List<Object> get props => [lat, lon, locale];
}
