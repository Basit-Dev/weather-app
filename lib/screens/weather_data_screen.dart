import 'package:clima/services/update_ui.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:clima/utilities/widgets.dart';

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
    updateWeatherData.updateLocationUI(widget.locationWeather);
    super.initState();
  }

  void getUI(dynamic weatherData) {
    setState(() {
      // Every time the weatherData updates in the UI the state will change an display the new information.
      updateWeatherData.updateLocationUI(weatherData);
    });
  }

  void background(String x) {
    if (updateTime > 8 && updateTime < 16) {
      backgroundImage = 'images/sunny_background.jpg';
    } else if (updateTime > 16 && updateTime < 20) {
      backgroundImage = 'images/cloudy_background.jpg';
    } else {
      backgroundImage = 'images/night_background.jpg';
    }
  }

  String backgroundImage;

  static var theHours = DateTime.now();
  var updateTime = theHours.hour;

  bool pressed = false;
  bool listViewVisible = false;
  bool checkWeatherButtonVisible = false;
  bool searchPressed = true;
  String searchBoxCityName;
  TimeOfDay now = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    print('the hour is $updateTime');
    background(backgroundImage);
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('$backgroundImage'),
            fit: BoxFit.cover,
            // Opacity the higher the number the less opaque.
            colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.6), BlendMode.dstATop),
          ),
        ),
        child: Column(
          children: <Widget>[
            SearchBox(
              searchButtonVisible: searchPressed,
              searchBoxVisible: () {
                setState(() {
                  pressed = true;
                  checkWeatherButtonVisible = true;
                  searchPressed = false;
                });
              },
              onSearchButtonPressed: pressed,
              getCityName: (value) {
                searchBoxCityName = value;
                print(searchBoxCityName);
              },
            ),
            checkWeatherButtonVisible
                ? Container(
                    margin: EdgeInsets.only(top: 15.0),
                    child: RaisedButton(
                        child: Text(
                          'Check Weather',
                          style: TextStyle(fontSize: 16.0, fontFamily: 'Typold Extended'),
                        ),
                        onPressed: () async {
                          var weatherData = await weatherModel.get5DayWeather(searchBoxCityName);
                          updateWeatherData.update5DayListUI(weatherData);
                          print('Searched Weather data $searchBoxCityName city $weatherData');
                          setState(() {
                            updateWeatherData.cityName = searchBoxCityName;
                            listViewVisible = true;
                            updateWeatherData.temperture = updateWeatherData.temperture1;
                          });
                        }),
                  )
                : SizedBox(),
            Container(
              margin: EdgeInsets.only(top: 15.0),
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
            listViewVisible
                ? Container(
                    padding: EdgeInsets.only(left: 0.0, top: 10.0),
                    height: 110.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        ListViewDataWidget(
                          time: updateWeatherData.time1.substring(10, updateWeatherData.time1.length - 3),
                          weatherIcon: updateWeatherData.weatherIcon,
                          temperture: updateWeatherData.temperture1,
                        ),
                        ListViewDataWidget(
                          time: updateWeatherData.time2.substring(10, updateWeatherData.time1.length - 3),
                          weatherIcon: updateWeatherData.weatherIcon2,
                          temperture: updateWeatherData.temperture2,
                        ),
                        ListViewDataWidget(
                          time: updateWeatherData.time3.substring(10, updateWeatherData.time1.length - 3),
                          weatherIcon: updateWeatherData.weatherIcon3,
                          temperture: updateWeatherData.temperture3,
                        ),
                        ListViewDataWidget(
                          time: updateWeatherData.time4.substring(10, updateWeatherData.time1.length - 3),
                          weatherIcon: updateWeatherData.weatherIcon4,
                          temperture: updateWeatherData.temperture4,
                        ),
                        ListViewDataWidget(
                          time: updateWeatherData.time5.substring(10, updateWeatherData.time1.length - 3),
                          weatherIcon: updateWeatherData.weatherIcon5,
                          temperture: updateWeatherData.temperture5,
                        ),
                        ListViewDataWidget(
                          time: updateWeatherData.time6.substring(10, updateWeatherData.time1.length - 3),
                          weatherIcon: updateWeatherData.weatherIcon5,
                          temperture: updateWeatherData.temperture5,
                        ),
                        ListViewDataWidget(
                          time: updateWeatherData.time7.substring(10, updateWeatherData.time1.length - 3),
                          weatherIcon: updateWeatherData.weatherIcon5,
                          temperture: updateWeatherData.temperture5,
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
            Expanded(
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(8.0),
                  child: Text(
                    '${updateWeatherData.weatherMessage} in ${updateWeatherData.cityName}',
                    textAlign: TextAlign.center,
                    style: kMessageTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
