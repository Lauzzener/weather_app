import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/constants/app_constants.dart';
import 'package:weather_app/core/error/exceptions.dart';
import 'package:weather_app/core/utils/get_location.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';
import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';

abstract interface class WeatherRemoteDataSource {
  Future<WeatherModel> getWeatherData();
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final Dio _dio;
  final GetLocation _getLocation;

  WeatherRemoteDataSourceImpl(this._dio, this._getLocation);

  @override
  Future<WeatherModel> getWeatherData() async {
    final apiKey = dotenv.env['WEATHER_API_KEY'];
    final Position coordinates = await _getLocation.determinePosition();
    final latitude = coordinates.latitude;
    final longitude = coordinates.longitude;

    List<Placemark> placemarks = await placemarkFromCoordinates(
      latitude,
      longitude,
    );

    final String city = placemarks[0].subAdministrativeArea!;

    try {
      final response = await _dio.get(
        '${AppConstants.apiUrl}/current.json',
        queryParameters: {
          'key': apiKey,
          'q': city,
          /* '$latitude,$longitude' */
          'aqi': 'no',
          'lang': 'pt',
        },
      );

      if (response.data == null) {
        throw ServerException("Get Weather response data is null!");
      }

      return WeatherModel.fromJson(response.data);
    } catch (e) {
      throw ServerException(
        "An unexpected error ocurred during the Get Weather requisition! Error: $e",
      );
    }
  }
}
