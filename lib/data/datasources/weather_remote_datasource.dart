import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

/// This is where we fetching weather data from the OpenWeatherMap API
abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeather(double lat, double lon);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final http.Client client;

  WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherModel> getWeather(double lat, double lon) async {
    // API key for OpenWeatherMap API
    final apiKey = 'd39d56c77e53ff78e679b0861e2b1daa';
    // Make a GET request to the OpenWeatherMap API
    final response = await client.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric',
      ),
    );

    if (response.statusCode == 200) {
      // Parse the JSON response
      final json = jsonDecode(response.body);
      // Create a [WeatherModel] object from the JSON
      return WeatherModel.fromJson(json);
    } else {
      // Throw an exception if the request failed
      throw Exception('Failed to load weather data');
    }
  }
}
