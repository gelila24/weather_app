// test/data/datasources/weather_remote_datasource_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/data/datasources/weather_remote_datasource.dart';
import 'package:weather_app/data/models/weather_model.dart';

import 'weather_remote_datasource_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('getWeather', () {
    test('should return WeatherModel when the response code is 200', () async {
      final mockClient = MockClient();

      when(mockClient.get(Uri.parse(
              'https://api.openweathermap.org/data/2.5/weather?lat=51.51494225418024&lon=-0.12363193061883422&appid=d39d56c77e53ff78e679b0861e2b1daa&units=metric')))
          .thenAnswer((_) async =>
              http.Response('{"name": "London", "main":{"temp": 24.0}}', 200));
      expect(
          await WeatherRemoteDataSourceImpl(client: mockClient)
              .getWeather(51.51494225418024, -0.12363193061883422),
          isA<WeatherModel>());
    });

    test('should throw an exception when the response code is not 200',
        () async {
      final mockClient = MockClient();

      when(mockClient.get(Uri.parse(
              'https://api.openweathermap.org/data/2.5/weather?lat=51.51494225418024&lon=-0.12363193061883422&appid=d39d56c77e53ff78e679b0861e2b1daa&units=metric')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(
          () => WeatherRemoteDataSourceImpl(client: mockClient)
              .getWeather(51.51494225418024, -0.12363193061883422),
          throwsException);
    });
  });
}
