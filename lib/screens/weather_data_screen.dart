import 'package:clima/services/update_ui.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  // Location weather variable to store the weather of the GPS location.
  final locationWeather;
  // Constructor to initialise the variable.
  LocationScreen({this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  // Two objects created for the WeatherModel and UpdateWeatherData class.
  WeatherModel weatherModel = WeatherModel();
  UpdateWeatherData updateWeatherData = UpdateWeatherData();

  @override
  void initState() {
    // initialised State for the updateWeatherData variable.
    updateWeatherData.updateUI(widget.locationWeather);
    super.initState();
  }

  void getUI(dynamic weatherData) {
    setState(() {
      // Every time the weatherData updates in the UI the state will change an display the new information.
      updateWeatherData.updateUI(weatherData);
    });
  }

  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/cloudy_background.jpg'),
            //fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 80.0),
              child: Row(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        pressed = true;
                      });
                    },
                    child: Icon(
                      Icons.search,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  pressed
                      ? Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 20.0),
                            child: TextField(
                              style: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.bold),
                              decoration: kInputDecoration,
                            ),
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Center(
                child: Text(
                  '${updateWeatherData.weatherIcon}',
                  style: kConditionTextStyle,
                ),
              ),
            ),
            Center(
              child: Text(
                '${updateWeatherData.temperture}°',
                style: kTempTextStyle,
              ),
            ),
            Container(
//color: Colors.brown,
              height: 80.0,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Container(
                    width: 80.0,
                    color: Colors.red,
                  ),
                  Container(
                    width: 80.0,
                    color: Colors.red,
                  ),
                  Container(
                    width: 80.0,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '${updateWeatherData.weatherMessage} in ${updateWeatherData.cityName}',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ),
          ],
        ),

        /*child: Container(
          child: Row(
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  setState(() {
                    pressed = true;
                  });
                },
                child: Icon(
                  Icons.search,
                  size: 50.0,
                  color: Colors.white,
                ),
              ),
              pressed
                  ? Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: TextField(
                          style: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.bold),
                          decoration: kInputDecoration,
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),*/
      ),
    );
  }
}

/* Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // Button to get the GPS location manually.
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weatherModel.getLocationWeather();
                      getUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  // Button to navigate to the city screen.
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
                        getUI(cityWeatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),*/
