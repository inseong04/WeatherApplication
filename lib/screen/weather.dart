import 'package:weather/model/weather_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

class WeatherPage extends StatefulWidget {
  WeatherPage({this.parseWeatherData, this.parseAirData});

  final dynamic parseWeatherData;
  final dynamic parseAirData;

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  WeatherModel weatherModel = WeatherModel();
  dynamic weatherData;
  String? cityName;
  String? description;
  int? cityTemp;
  var date = DateTime.now();
  late Widget icon;
  late Widget airIcon;
  late Widget airStateText;
  double? dust;
  double? ultraDust;

  @override
  void initState() {
    super.initState();
    updateData(widget.parseWeatherData, widget.parseAirData);
  }

  void updateData(dynamic weatherData, dynamic airData) {
    double? tempD = weatherData['main']['temp'];
    int condition = weatherData['weather'][0]['id'];
    int index = airData['list'][0]['main']['aqi'];
    cityTemp = tempD!.round();
    cityName = weatherData['name'];
    icon = weatherModel.getWeatherIcon(condition)!;
    description = weatherData['weather'][0]['description'];
    airIcon = weatherModel.getAirIcon(index);
    airStateText = weatherModel.getAirCondition(index);
    dust = airData['list'][0]['components']['pm10'];
    ultraDust = airData['list'][0]['components']['pm2_5'];
  }

  String getSystemTime() {
    var nowTime = DateTime.now();
    return DateFormat("h:mm a").format(nowTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: null,
      ),
      backgroundColor: Colors.lightBlue,
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100.0,
                  ),
                  Text(
                    cityName!,
                    style: const TextStyle(
                      fontSize: 35.0,
                      fontFamily: 'Godo',
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimerBuilder.periodic(
                        (const Duration(minutes: 1)),
                        builder: (context) {
                          return Text('${getSystemTime()}',
                              style: const TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'Godo',
                                color: Colors.white,
                              ));
                        },
                      ),
                      Text(
                        DateFormat(' - EEEE').format(date),
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Godo',
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        DateFormat(', d MMM, yyy').format(date),
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Godo',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: Column(
                      children: [
                        Text(description!,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Godo',
                              color: Colors.white,
                            )),
                        const SizedBox(
                          height: 30.0,
                        ),
                        icon,
                      ],
                    ),
                  ),
                  Text(
                    '$cityTemp \u2103',
                    style: const TextStyle(
                      fontSize: 50.0,
                      fontFamily: 'Godo',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const Divider(
                  height: 15.0,
                  thickness: 2.0,
                  color: Colors.white30,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'AQI',
                          style: TextStyle(
                            fontFamily: 'Godo',
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        airIcon,
                        const SizedBox(
                          height: 5.0,
                        ),
                        airStateText,
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          'MicroDust',
                          style: TextStyle(
                            fontFamily: 'Godo',
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '$dust',
                          style: const TextStyle(
                            fontFamily: 'Godo',
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        const Text(
                          '㎍/m3',
                          style: TextStyle(
                              fontFamily: 'Godo',
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Ultra\nMicroDust',
                          style: TextStyle(
                            fontFamily: 'Godo',
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '$ultraDust',
                          style: const TextStyle(
                            fontFamily: 'Godo',
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        const Text(
                          '㎍/m3',
                          style: TextStyle(
                              fontFamily: 'Godo',
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
