import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:intl/intl.dart';

class MainWeatherData extends StatelessWidget {
  final Weather weather;
  const MainWeatherData({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    String temperature = weather.tempFeelsLike?.celsius?.toStringAsFixed(1) ?? 'N/A';
    String areaName = weather.areaName ?? 'Unknown location';
    DateTime date = weather.date ?? DateTime.now();
    
    String formattedDate = DateFormat('hh:mm a - EEEE, dd MMM \'yy').format(date);

    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$temperature°",
            style: const TextStyle(
              fontSize: 100,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            areaName,
            style: const TextStyle(
              fontSize: 50,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            formattedDate,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
