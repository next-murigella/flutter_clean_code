import 'package:flutter_hsc/app/domain/entities/weather_obj.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel(_id, _main, _description, _icon, _weatherAttributes, _name) {
    id = _id;
    main = _main;
    description = _description;
    icon = _icon;
    weatherAttributes = _weatherAttributes;
    name = _name;
  }

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    var _id = json['weather'][0]['id'] ?? 0;
    var _main = json['weather'][0]['main'] ?? "";
    var _description = json['weather'][0]['description'] ?? "";
    var _icon = json['weather'][0]['icon'] ?? "";
    var _weatherAttributes = WeatherAttributesModel.fromJson(json);
    var _name = json['name'];

    return WeatherModel(
        _id, _main, _description, _icon, _weatherAttributes, _name);
  }
}

class WeatherAttributesModel extends WeatherAttributes {
  WeatherAttributesModel(
      _temp, _feelsLike, _tempMin, _tempMax, _humidity, _wind) {
    temp = _temp;
    feelsLike = _feelsLike;
    tempMin = _tempMin;
    tempMax = _tempMax;
    humidity = double.parse(_humidity.toString());
    wind = _wind;
  }

  factory WeatherAttributesModel.fromJson(Map<String, dynamic> json) {
    var _temp = json['main']['temp'];
    var _feelsLike = json['main']['feels_like'];
    var _tempMin = json['main']['temp_min'];
    var _tempMax = json['main']['temp_max'];
    var _humidity = json['main']['humidity'];
    var _wind = WindModel.fromJson(json);

    return WeatherAttributesModel(
        _temp, _feelsLike, _tempMin, _tempMax, _humidity, _wind);
  }
}

class WindModel extends Wind {
  WindModel(_speed, _deg, _gust) {
    speed = double.parse(_speed.toString());
    deg = double.parse(_deg.toString());
    gust = double.parse(_gust.toString());
  }

  factory WindModel.fromJson(Map<String, dynamic> json) {
    var _speed = json['wind']['speed'];
    var _deg = json['wind']['deg'];
    var _gust = json['wind']['gust'];

    return WindModel(_speed, _deg, _gust);
  }
}
