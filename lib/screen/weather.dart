import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/*import 'package:geolocator/geolocator.dart';
import "package:http/http.dart" as http;
import 'dart:convert';*/
import 'package:weather/model/location_model.dart';
import 'package:weather/model/network_model.dart';

const apiKey = 'd07fdfb142d541d6e4e7b97d909e7e3a';

class WeatherPage extends StatefulWidget {

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  double? latitude;
  double? longitude;
  dynamic weatherData;
  String? cityName;
  int? cityTemp;

  @override
  void initState() {
    super.initState();
    getLocation();
    updateData(weatherData);
  }

  void updateData(dynamic weatherData) {

    cityName = weatherData['name'];
    double cityTemp2 = weatherData['main']['temp'];
    cityTemp = cityTemp2.round();
  }

  void getLocation() async{
    LocationModel locationModel = LocationModel();
    await locationModel.getCurrentLocation();
    latitude = locationModel.latitude;
    longitude = locationModel.longitude;

    String openweatherUrl = 'https://api.openweathermap.org/data/2.5/weather'
        '?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';

    Network network = Network(openweatherUrl);

    weatherData = await network.getJsonData();
    print('weat$weatherData');
  }
  
/*  void fetchData() async{
    http.Response response = await http.get(Uri.parse('https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1'));

    if(response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      var myJson = jsonDecode(jsonData)['weather'][0]['description'];
      print(myJson);
    }
    else {
      print(response.statusCode);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$cityName',
              style: TextStyle(
                fontSize: 30.0
              ),
            ),
            Text(
              '$cityTemp',
              style: TextStyle(
                fontSize: 30.0
              ),
            )
          ],
        ),
      ),
    );
  }
}
