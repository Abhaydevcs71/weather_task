import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class WeatherDataNotifier extends ChangeNotifier {
  Weather? _currentWeather;
  bool _hasError = false;

  Weather? get currentWeather => _currentWeather;
  bool get hasError => _hasError;

  Future<void> updateCityName(String cityName) async {
    try {
      WeatherFactory weatherFactory = WeatherFactory('71ced824c06aeece5832d666f4f632a8', language: Language.ENGLISH);
      _currentWeather = await weatherFactory.currentWeatherByCityName(cityName);
      _hasError = false;
    } catch (e) {
      print('Error fetching weather data: $e');
      _hasError = true;
      _currentWeather = null;
    }
    notifyListeners();
  }
}
