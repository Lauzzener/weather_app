import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/usecase/usecase.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';
import 'package:weather_app/features/weather/domain/usecases/get_weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeather _getWeather;
  WeatherBloc({required GetWeather getWeather})
    : _getWeather = getWeather,
      super(WeatherInitial()) {
    on<WeatherGetData>(_onGetWeather);
  }

  void _onGetWeather(WeatherGetData event, Emitter emit) async {
    emit(WeatherLoading());

    final res = await _getWeather(NoParams());

    res.fold(
      (l) => emit(WeatherFailure(l.message)),
      (r) => emit(WeatherSuccess(r)),
    );
  }
}
