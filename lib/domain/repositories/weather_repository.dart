import 'package:weather_app/domain/entities/weather.dart';


/// `WeatherRepository` is an abstract class that defines the contract for classes that will fetch weather data from a data source.
/// It has a single method, `getWeather`, which takes a latitude and longitude as parameters and returns a `Future` that resolves to a `Weather` object.
abstract class WeatherRepository {
  Future<Weather> getWeather(double lat, double lon);
}
