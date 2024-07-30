// lib/data/models/weather_model.dart
import '../../domain/entities/weather.dart';

/// A class that represents the weather data in the form of a model.
class WeatherModel extends Weather {
  WeatherModel({required String cityName, required double temperature})
      : super(cityName: cityName, temperature: temperature);

  /// Creates a [WeatherModel] object from a JSON map.
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temperature: (json['main']['temp'] as num).toDouble(),
    );
  }

  /// Converts the [WeatherModel] object to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'name': cityName,
      'main': {'temp': temperature},
    };
  }
}
