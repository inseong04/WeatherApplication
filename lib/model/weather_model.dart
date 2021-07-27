import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherModel {
  Widget? getWeatherIcon(int condition) {
    if (condition < 300) {
      return SvgPicture.asset(
        'svg/storm.svg',
        width: 150.0,
        height: 150.0,
      );
    } else if (condition < 600) {
      return SvgPicture.asset(
        'svg/snowy.svg',
        width: 150.0,
        height: 150.0,
      );
    } else if (condition == 800) {
      return SvgPicture.asset(
        'svg/sun.svg',
        width: 150.0,
        height: 150.0,
      );
    } else if (condition <= 804) {
      return SvgPicture.asset(
        'svg/sun-cloudy.svg',
        width: 150.0,
        height: 150.0,
      );
    } else {
      return null;
    }
  }

  Widget getAirIcon(int index) {
    switch (index) {
      case 1:
        return SvgPicture.asset(
          'svg/good.svg',
          width: 30.0,
          height: 30.0,
        );
        break;
      case 2:
        return SvgPicture.asset(
          'svg/fair.svg',
          width: 30.0,
          height: 30.0,
        );
        break;
      case 3:
        return SvgPicture.asset(
          'svg/moderate.svg',
          width: 30.0,
          height: 30.0,
        );
        break;
      case 4:
        return SvgPicture.asset(
          'svg/poor.svg',
          width: 30.0,
          height: 30.0,
        );
        break;
      case 5:
        return SvgPicture.asset(
          'svg/verypoor.svg',
          width: 30.0,
          height: 30.0,
        );
        break;
      default:
        {
          return SvgPicture.asset(
            'svg/moderate.svg',
            width: 30.0,
            height: 30.0,
          );
        }
    }
  }

  Widget getAirCondition(int index) {
    switch (index) {
      case 1:
        return const Text(
          'Very Good',
          style: TextStyle(
              fontFamily: 'Godo',
              fontSize: 16.0,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        );
        break;
      case 2:
        return const Text(
          'Good',
          style: TextStyle(
              fontFamily: 'Godo',
              fontSize: 16.0,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        );
        break;
      case 3:
        return const Text(
          'Moderate',
          style: TextStyle(
              fontFamily: 'Godo',
              fontSize: 16.0,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        );
        break;
      case 4:
        return const Text(
          'Poor',
          style: TextStyle(
              fontFamily: 'Godo',
              fontSize: 16.0,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        );
        break;
      case 5:
        return const Text(
          'Very Poor',
          style: TextStyle(
              fontFamily: 'Godo',
              fontSize: 16.0,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        );
        break;
      default:
        {
          return const Text(
            'Moderate',
            style: TextStyle(
                fontFamily: 'Godo',
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          );
          break;
        }
    }
  }
}
