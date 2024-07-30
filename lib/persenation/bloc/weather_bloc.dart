// lib/presentation/bloc/weather_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/weather.dart';
import '../../domain/usecases/get_weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

/// This class is responsible for managing the state of the weather data.
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeather getWeather;
/// Creates a [WeatherBloc] object.
/// It takes a [GetWeather] object as a parameter in its constructor.
  WeatherBloc({required this.getWeather}) : super(WeatherInitial()) {
    on<FetchWeather>(_onFetchWeather);
  }
/// Handles the event of fetching weather data.
/// Executes the [GetWeather] function from the [WeatherRepository] class
/// with the given latitude and longitude.
  Future<void> _onFetchWeather(
      FetchWeather event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final weather = await getWeather.execute(event.lat, event.lon);
      emit(WeatherLoaded(weather: weather));
    } catch (e) {
      emit(WeatherError(message: 'Failed to fetch weather data'));
    }
  }
}
