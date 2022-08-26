import 'package:equatable/equatable.dart';

class WeatherParam extends Equatable {
  final String unit;
  final String postalCode;
  final String countryCode;
  final String locale;

  const WeatherParam(this.postalCode, this.countryCode, this.locale, this.unit);

  @override
  List<Object> get props => [postalCode, countryCode, locale, unit];
}
