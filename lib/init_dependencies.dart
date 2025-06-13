import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/core/utils/get_location.dart';
import 'package:weather_app/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:weather_app/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_app/features/weather/domain/usecases/get_weather.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  await dotenv.load(fileName: ".env");

  serviceLocator.registerSingleton<Dio>(Dio());
  serviceLocator.registerSingleton<GetLocation>(GetLocation());

  _initWeather();
}

void _initWeather() {
  serviceLocator
    ..registerFactory<WeatherRemoteDataSource>(
      () => WeatherRemoteDataSourceImpl(
        serviceLocator<Dio>(),
        serviceLocator<GetLocation>(),
      ),
    )
    ..registerFactory<WeatherRepository>(
      () => WeatherRepositoryImpl(serviceLocator()),
    )
    ..registerFactory(() => GetWeather(serviceLocator()))
    ..registerFactory(() => WeatherBloc(getWeather: serviceLocator()));
}
