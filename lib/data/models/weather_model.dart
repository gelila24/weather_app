// lib/data/models/weather_model.dart
import '../../domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel({required String cityName, required double temperature})
      : super(cityName: cityName, temperature: temperature);

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temperature: (json['main']['temp'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': cityName,
      'main': {'temp': temperature},
    };
  }
}
