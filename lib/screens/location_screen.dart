import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';

import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;

  LocationScreen({this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  int temperture;
  String cityName;
  String weatherIcon;
  String weatherMessage;

  @override
  void initState() {
    updateUI(widget.locationWeather);
    super.initState();
  }

  // We use dynamic as type because weatherData is a var.
  void updateUI(dynamic weatherData) {
    // 3. lon/lat stored in weatherData from push
    // 8A city stored in weatherData from cityWeatherData
    setState(() {
      if (weatherData == null) {
        temperture = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get weather data';
        cityName = '';
        return; // return ends the method.
      }
      double temp = weatherData['main']['temp'];
      temperture = temp.toInt();
      weatherMessage = weatherModel.getMessage(temperture);
      // The var condition can only be used inside this method updateUI, if you want to use it in other places it needs to be declared
      // where the other variables are placed at the top.
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weatherModel.getWeatherIcon(condition);
      cityName = weatherData['name'];
      // 4. After the above is processed the location_screen displays the da.ta in the appropriate text fields
      // 9A After the above is processed cityName is displayed in the city text field.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weatherModel.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    // 1A. When we press this button we go to the city_screen
                    onPressed: () async {
                      // 4A The city_name value is passed into typedNamed
                      var typedNamed = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                      if (typedNamed != null) {
                        // 5A TypeNamed gets passed to the getCityWeather method
                        var cityWeatherData = await weatherModel.getCityWeather(typedNamed);
                        // 7A weatherData now holds the NetworkHelper url which gets passed to the updateUI method
                        updateUI(cityWeatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperture°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weatherMessage in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
