import 'package:fpdart/fpdart.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/usecase/usecase.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';

class GetWeather implements Usecase<Weather, NoParams> {
  final WeatherRepository _repository;
  GetWeather(this._repository);

  @override
  Future<Either<Failure, dynamic>> call(NoParams params) async {
    return await _repository.getWeatherData();
  }
}
