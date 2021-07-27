import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather/data/location_data.dart';
import 'package:weather/data/network_data.dart';
import 'package:weather/screen/weather.dart';

const apiKey = 'd07fdfb142d541d6e4e7b97d909e7e3a';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  double? latitude;
  double? longitude;

  @override
  void initState() {
    super.initState();
    getLocationAndPush();
  }

  @override
  void didUpdateWidget(covariant SplashPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    Navigator.pop(context);
  }

  void getLocationAndPush() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    String openweatherUrl = 'https://api.openweathermap.org/data/2.5/weather'
        '?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';

    String airUrl = 'http://api.openweathermap.org/data/2.5/'
        'air_pollution?lat=$latitude&lon=$longitude&appid=$apiKey';



    Network network = Network(openweatherUrl, airUrl);
    var weatherData = await network.getJsonData();
    var airData = await network.getAirData();

    Timer(
      const Duration(seconds: 2),
          () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>
            WeatherPage(parseWeatherData: weatherData,
                parseAirData: airData)),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
            SvgPicture.asset(
              'svg/splash_image.svg',
              width: 150.0,
              height: 150.0,
            ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                'What\'s the Weather?',
                style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Godo',
                    color: Colors.white),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
