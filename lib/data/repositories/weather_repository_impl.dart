// lib/data/repositories/weather_repository_impl.dart
import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasources/weather_remote_datasource.dart';
import '../models/weather_model.dart';

/// Implementation of the [WeatherRepository] interface.
/// It takes a [WeatherRemoteDataSource] as a parameter in its constructor.
class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl({required this.remoteDataSource});
/// Executes the [getWeather] function from the [WeatherRemoteDataSource] class
/// with the given latitude and longitude.
/// Returns a [Weather] object.
  @override
  Future<Weather> getWeather(double lat, double lon) async {
    final WeatherModel weatherModel =
        await remoteDataSource.getWeather(lat, lon);
    return weatherModel; 
  }
}
