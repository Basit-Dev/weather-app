import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class ListViewDataWidget extends StatelessWidget {
  final String listCityName;
  final int temperture;
  final String weatherIcon;
  final String time;

  const ListViewDataWidget({this.listCityName, this.weatherIcon, this.temperture, this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '$time',
            style: TextStyle(fontSize: 18.0),
          ),
          Text(
            '$weatherIcon',
            style: TextStyle(fontSize: 40.0),
          ),
          SizedBox(
            height: 2.0,
          ),
          Text(
            //'${updateWeatherData.cityName}',
            '$temperture°',
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  final bool onSearchButtonPressed;
  final Function searchBoxVisible;
  final Function getCityName;
  final bool searchButtonVisible;

  const SearchBox({this.searchBoxVisible, this.onSearchButtonPressed, this.getCityName, this.searchButtonVisible});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 80.0),
      child: Row(
        children: <Widget>[
          searchButtonVisible
              ? FlatButton(
                  onPressed: searchBoxVisible,
                  child: Icon(
                    Icons.search,
                    size: 50.0,
                    color: Colors.white,
                  ),
                )
              : SizedBox(),
          onSearchButtonPressed
              ? Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: TextField(
                      onChanged: getCityName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      decoration: kInputDecoration,
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
