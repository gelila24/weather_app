// test/presentation/bloc/weather_bloc_test.dart
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/domain/usecases/get_weather.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/persenation/bloc/weather_bloc.dart';

class MockGetWeather extends Mock implements GetWeather {}

@GenerateMocks([MockGetWeather])
void main() {
  late WeatherBloc weatherBloc;
  late MockGetWeather mockGetWeather;

  setUp(() {
    mockGetWeather = MockGetWeather();
    weatherBloc = WeatherBloc(getWeather: mockGetWeather);
  });

  test('initial state should be WeatherInitial', () {
    expect(weatherBloc.state, equals(WeatherInitial()));
  });

  blocTest<WeatherBloc, WeatherState>(
    'emits [WeatherLoading, WeatherLoaded] when FetchWeather is added',
    build: () {
      // Setup the mock response
      when(mockGetWeather.execute(51.51494225418024, -0.12363193061883422))
          .thenAnswer(
              (_) async => Weather(cityName: 'London', temperature: 24.0));

      return weatherBloc;
    },
    act: (bloc) => bloc
        .add(FetchWeather(lat: 51.51494225418024, lon: -0.12363193061883422)),
    expect: () => [WeatherLoading(), isA<WeatherLoaded>()],
  );
}
