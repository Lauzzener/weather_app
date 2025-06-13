import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class WeatherRepository {
  Future<Either<Failure, Weather>> getWeatherData();
}
