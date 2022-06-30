class WeatherEntity {
  int? id;
  String? main;
  String? description;
  String? icon;
  String? name;
  WeatherAttributes? weatherAttributes;
}

class WeatherAttributes {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  double? humidity;
  Wind? wind;
}

class Wind {
  double? speed;
  double? deg;
  double? gust;
}
