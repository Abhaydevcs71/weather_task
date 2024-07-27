import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_task/utils/colors.dart';
import 'package:weather_task/viewModel/get_weathet_data.notifier.dart';
import 'package:weather_task/views/main_screen/widgets/main_weather_data.dart';
import 'package:weather_task/views/main_screen/widgets/secondary_weather_data.dart';
import 'package:weather_task/views/main_screen/widgets/textform_field.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherDataNotifier>(
          create: (context) => WeatherDataNotifier(),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.MainColor,
        body: SafeArea(
          child: Consumer<WeatherDataNotifier>(
            builder: (context, weatherDataNotifier, child) {
              // Check if the weather data is available or if there was an error
              if (weatherDataNotifier.currentWeather != null) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CityTextField(),
                      const SizedBox(height: 30),
                      MainWeatherData(weather: weatherDataNotifier.currentWeather!),
                      const SizedBox(height: 20),
                      SecondaryWeatherData(weather: weatherDataNotifier.currentWeather!),
                    ],
                  ),
                );
              } else if (weatherDataNotifier.hasError) {
                return  AlertDialog(title: const Text("Error fetching weather data"),
                actions: [TextButton(onPressed: () {
                  Navigator.pushNamed(context,'/MainScreen');
                }, child: const Text("Back"))],
                );
                
                //Center(child: Text('Error fetching weather data', style: TextStyle(color: Colors.white)));
              } else {
                // Show the text field and a prompt to search for a city
                return const Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CityTextField(),
                        SizedBox(height: 20),
                        Text(
                          'Please search a city',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
