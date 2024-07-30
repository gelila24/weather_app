// test/repository/weather_repository_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/data/datasources/weather_remote_datasource.dart';
import 'package:weather_app/data/models/weather_model.dart';

import 'weather_repository_test.mocks.dart';

// Create a Mock class for WeatherRemoteDataSource
class WeatherRepositoryTest extends Mock implements WeatherRemoteDataSource {}

@GenerateMocks([WeatherRepositoryTest])
void main() {
  test(
      'should return Weather when the call to remote data source is successful',
      () async {
    var mockDataSource = WeatherRepositoryTest();
    var repositoryTest = MockWeatherRepositoryTest();
    final tWeatherModel = WeatherModel(cityName: 'London', temperature: 24.0);
    when(repositoryTest.getWeather(51.51494225418024, -0.12363193061883422))
        .thenAnswer((_) async => Future.value(tWeatherModel));

    final result = await mockDataSource.getWeather(
        51.51494225418024, -0.12363193061883422);

    expect(result, isA<WeatherModel>());
  });
}
