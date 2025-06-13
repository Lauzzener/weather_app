import 'package:weather_app/features/weather/domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel({required super.location, required super.current});

  static WeatherModel fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      location: _locationFromJson(json['location']),
      current: _currentFromJson(json['current']),
    );
  }

  static Location _locationFromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      region: json['region'],
      country: json['country'],
      lat: json['lat'],
      lon: json['lon'],
      tz_id: json['tz_id'],
      localtime_epoch: json['localtime_epoch'],
      localtime: json['localtime'],
    );
  }

  static Current _currentFromJson(Map<String, dynamic> json) {
    return Current(
      last_updated_epoch: json['last_updated_epoch'],
      last_updated: json['last_updated'],
      temp_c: json['temp_c'],
      is_day: json['is_day'],
      condition: _conditionFromJson(json['condition']),
      wind_kph: json['wind_kph'],
      wind_dir: json['wind_dir'],
      humidity: json['humidity'],
      cloud: json['cloud'],
    );
  }

  static Condition _conditionFromJson(Map<String, dynamic> json) {
    return Condition(text: json['text'], icon: json['icon']);
  }
}
