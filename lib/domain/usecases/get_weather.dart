import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';

/// This class is used to execute the `getWeather` function from the `WeatherRepository` class.
/// It takes a `WeatherRepository` object as a parameter in its constructor.
class GetWeather {
  final WeatherRepository repository;
  GetWeather({required this.repository});

  /// Executes the [getWeather] function from the [WeatherRepository] class
  /// with the given latitude and longitude.
  Future<Weather> execute(double lat, double lon) {
    return repository.getWeather(lat, lon);
  }
}
