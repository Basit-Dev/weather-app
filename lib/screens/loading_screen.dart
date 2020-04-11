import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';

/// This class uses the location and networkhelper classes.
///
///
const String apiKey = '80e5047a87f2b3bc9ab4587a256a47fe';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // initialization variables
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    // 1. getLocation gets called.
    getLocationData();
  }

  // 2. A object from the location class is created and the getCurrentLocation is initialised from the Location class.
  void getLocationData() async {
    Location location = Location();
    await location
        .getCurrentLocation(); // 3. await means do not print the lon/lat until location.getCurrentLocation has completed.

    // 5. lon and lat received from getCurrentLocation and stored in longitude/latitude.
    longitude = location.longitude;
    latitude = location.latitude;

    // 6. NetworkHelper takes the API url as a parameter which is processed in the NetworkHelper class.
    NetworkHelper networkHelper =
        NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    // 10. getData is stored in to weatherData.
    var weatherData = await networkHelper.getData();
    print(weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
