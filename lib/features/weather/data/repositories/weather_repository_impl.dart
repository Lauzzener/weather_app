import 'package:fpdart/fpdart.dart';
import 'package:weather_app/core/error/exceptions.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource _remoteDataSource;
  WeatherRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, Weather>> getWeatherData() async {
    try {
      final response = await _remoteDataSource.getWeatherData();

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
