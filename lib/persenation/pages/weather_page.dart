// lib/presentation/pages/weather_page.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/domain/usecases/get_weather.dart';
import 'package:weather_app/persenation/bloc/weather_bloc.dart';
import 'package:weather_app/persenation/themes/app_theme.dart';
import 'package:weather_app/persenation/widgets/base_button.dart';

class WeatherPage extends StatefulWidget {
  final double lat;
  final double lon;

  const WeatherPage({Key? key, required this.lat, required this.lon})
      : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  bool isCelsius = true;

  void _toggleTemperatureUnit() {
    setState(() {
      isCelsius = !isCelsius;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => WeatherBloc(
          getWeather: RepositoryProvider.of<GetWeather>(context),
        )..add(FetchWeather(lat: widget.lat, lon: widget.lon)),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitial) {
              return const SizedBox();
            } else if (state is WeatherLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is WeatherLoaded) {
              double temperature = state.weather.temperature;
              if (!isCelsius) {
                temperature = temperature * 9 / 5 + 32; // Convert to Fahrenheit
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 24),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/weather_icon.png',
                          width: 300,
                          height: 300 / 4 * 3, // 4:3 aspect ratio
                        ),
                        Text('THIS IS THE WEATHER APP',
                            style: AppTheme.primaryTextStyle),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Temperature',
                                style: AppTheme.secondaryTextStyle,
                              ),
                              Text(
                                  '${temperature.toStringAsFixed(1)} ${isCelsius ? 'degrees' : 'fahrenheit'}',
                                  style: AppTheme.normalTextStyle),
                              Text(
                                'Location',
                                style: AppTheme.secondaryTextStyle,
                              ),
                              Text(
                                '${state.weather.cityName}',
                                style: AppTheme.normalTextStyle,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Celsius/Fahrenheit',
                                style: AppTheme.normalTextStyle,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              CupertinoSwitch(
                                value: isCelsius,
                                onChanged: (value) {
                                  _toggleTemperatureUnit();
                                },
                              )
                            ]),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: BaseButton(
                      title: "Refresh",
                      onPressed: () => context
                          .read<WeatherBloc>()
                          .add(FetchWeather(lat: widget.lat, lon: widget.lon)),
                    ),
                  )
                ],
              );
            } else if (state is WeatherError) {
              return Center(child: Text(state.message));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
