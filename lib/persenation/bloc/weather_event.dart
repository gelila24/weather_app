part of 'weather_bloc.dart';

/// This class is the base class for all weather events.
abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

/// This class represents the event of fetching weather data.
class FetchWeather extends WeatherEvent {
  final double lat;
  final double lon;

  /// Creates a [FetchWeather] object.
  /// It takes a latitude and longitude as parameters.

  FetchWeather({required this.lat, required this.lon});

  @override
  List<Object> get props => [lat, lon];
}
