import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  Future getLocationData() async {
    WeatherModel weatherModal = WeatherModel();
    // we can also use inline method call without creating an instance variable : var weatherData = await weatherModal().getLocationWeather();
    var weatherData = await weatherModal.getLocationWeather(); // 1. gets lon/lat from getLocationWeather
    print('getLocationWeather Initilised =  WeatherData');

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(locationWeather: weatherData);
        },
      ),
    );
  }

  // 2. Loads the spinner and when data received the navigator push goes to the location screen.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
