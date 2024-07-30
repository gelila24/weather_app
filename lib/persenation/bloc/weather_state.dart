part of 'weather_bloc.dart';

/// This class is extended by all weather states.
abstract class WeatherState extends Equatable {
  // Constructor for the weather state.
  const WeatherState();
  @override
  List<Object?> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

/// This class represents a loaded weather state.
///And contains the weather data fetched from the API.
class WeatherLoaded extends WeatherState {
  final Weather weather;

  /// Creates a new instance of [WeatherLoaded] with the given [weather] data.
  WeatherLoaded({required this.weather});

  @override
  List<Object?> get props => [weather];
}

// This class represents a weather state where an error has occurred.
// It holds an error message indicating the reason for the error.
class WeatherError extends WeatherState {
  // The error message describing the reason for the error.
  final String message;

  // Creates a new instance of [WeatherError] with the given [message].
  WeatherError({required this.message});

  @override
  // Returns a list containing the [message] of the error.
  List<Object?> get props => [message];
}
