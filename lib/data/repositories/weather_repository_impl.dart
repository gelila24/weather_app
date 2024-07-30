// lib/data/repositories/weather_repository_impl.dart
import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasources/weather_remote_datasource.dart';
import '../models/weather_model.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Weather> getWeather(double lat, double lon) async {
    final WeatherModel weatherModel =
        await remoteDataSource.getWeather(lat, lon);
    return weatherModel; // Returning WeatherModel, which extends Weather
  }
}
