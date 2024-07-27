import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:weather/weather.dart';
import 'package:weather_task/utils/weather_condition.dart';

class SecondaryWeatherData extends StatelessWidget {
  final Weather weather;
  const SecondaryWeatherData({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.4),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 20),
        child: Stack(
          children: [
            Positioned(
              right: 10,
              top: 5,
              child: Container(
                height: 120,
              width: 120,
                child: getWeatherIcon(weather.weatherConditionCode ?? 0),
            )),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getWeatherCondition(weather.weatherConditionCode ?? 0),
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.7)),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Text(
                    weather.weatherDescription ?? "No description",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.7)),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Temp max',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '${weather.tempMax?.celsius?.toStringAsFixed(1) ?? "N/A"}°',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                            height: 30,
                            width: 10,
                            child: Image.asset(
                              'assets/images/hot.png',
                              fit: BoxFit.cover,
                            ))
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Temp min',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '${weather.tempMin?.celsius?.toStringAsFixed(1) ?? "N/A"}°',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                            height: 30,
                            width: 10,
                            child: Image.asset(
                              'assets/images/cold.png',
                              fit: BoxFit.cover,
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Humidity',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '${weather.humidity?.toStringAsFixed(1) ?? "N/A"}%',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(
                          FeatherIcons.droplet,
                          size: 24,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cloudy',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '${weather.cloudiness?.toStringAsFixed(1) ?? "N/A"}%',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(
                          FeatherIcons.cloud,
                          size: 24,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Wind',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '${weather.windSpeed?.toStringAsFixed(1) ?? "N/A"} Km/h',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(
                          FeatherIcons.wind,
                          size: 24,
                          color: Colors.white,
                        ),
                        
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30,),
                const Divider(endIndent: 10,indent: 10,thickness: 2,),
                const SizedBox(height: 70,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
