import 'package:flutter/material.dart';

String getWeatherCondition(int code) {
  if (code >= 200 && code <= 299) {
    return 'Thunderstorm';
  } else if (code >= 300 && code <= 399) {
    return 'Drizzle';
  } else if (code >= 500 && code <= 599) {
    return 'Rain';
  } else if (code >= 600 && code <= 699) {
    return 'Snow';
  } else if (code >= 700 && code <= 799) {
    return 'Mist';
  } else if (code == 800) {
    return 'Clear';
  } else if (code >= 801 && code <= 899) {
    return 'Clouds';
  } else {
    return 'Unknown';
  }
}

Widget getWeatherIcon(int code) {
  switch (code) {
    case > 200 && <= 299:
      return Image.asset('assets/images/200.png', fit: BoxFit.cover);
    case > 300 && <= 399:
      return Image.asset('assets/images/300.png', fit: BoxFit.cover);
    case > 500 && <= 599:
      return Image.asset('assets/images/500.png', fit: BoxFit.cover);
    case > 600 && <= 699:
      return Image.asset('assets/images/600.png', fit: BoxFit.cover);
    case > 700 && <= 799:
      return Image.asset('assets/images/700.png', fit: BoxFit.cover);
    case == 800:
      return Image.asset('assets/images/800.png', fit: BoxFit.cover);
    case == 801 && <= 899:
      return Image.asset('assets/images/01.png', fit: BoxFit.cover);

    default:
      return Image.asset('assets/images/01.png', fit: BoxFit.cover);
  }
}
