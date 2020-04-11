import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    // await means do not print the lon/lat until location.getCurrentLocation has completed.
    print(location.longitude);
    print(location.latitude);
  }

  void getData() async {
    http.Response response = await http
        .get('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02');
    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);

      double temp = decodedData['main']['temp'];
      int condition = decodedData['weather'][0]['id'];
      String cityName = jsonDecode(data)['name'];
      print('$temp $condition $cityName');
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
