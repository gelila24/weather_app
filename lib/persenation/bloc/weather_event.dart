// lib/presentation/bloc/weather_event.dart
part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class FetchWeather extends WeatherEvent {
  final double lat;
  final double lon;

  FetchWeather({required this.lat, required this.lon});

  @override
  List<Object> get props => [lat, lon];
}
