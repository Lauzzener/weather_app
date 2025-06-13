part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherSuccess extends WeatherState {
  final Weather weatherData;

  WeatherSuccess(this.weatherData);
}

final class WeatherFailure extends WeatherState {
  final String failureMessage;

  WeatherFailure(this.failureMessage);
}
