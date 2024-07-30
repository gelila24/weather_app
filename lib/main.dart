// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/persenation/bloc/weather_bloc.dart';
import 'package:weather_app/persenation/pages/weather_page.dart';

import 'data/datasources/weather_remote_datasource.dart';
import 'data/repositories/weather_repository_impl.dart';
import 'domain/usecases/get_weather.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<WeatherRemoteDataSource>(
          create: (context) =>
              WeatherRemoteDataSourceImpl(client: http.Client()),
        ),
        RepositoryProvider<WeatherRepository>(
          create: (context) => WeatherRepositoryImpl(
            remoteDataSource:
                RepositoryProvider.of<WeatherRemoteDataSource>(context),
          ),
        ),
        RepositoryProvider<GetWeather>(
          create: (context) => GetWeather(
            repository: RepositoryProvider.of<WeatherRepository>(context),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<WeatherBloc>(
            create: (context) => WeatherBloc(
              getWeather: RepositoryProvider.of<GetWeather>(context),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Weather App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const WeatherPage(
            lat: 51.51494225418024,
            lon: -0.12363193061883422,
          ),
        ),
      ),
    );
  }
}
