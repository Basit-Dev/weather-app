import 'weather.dart';

class UpdateWeatherData {
  int temperture;
  int temperture1;
  int temperture2;
  int temperture3;
  int temperture4;
  int temperture5;
  int temperture6;
  int temperture7;

  String cityName;
  String weatherIcon;
  String weatherIcon1;
  String weatherIcon2;
  String weatherIcon3;
  String weatherIcon4;
  String weatherIcon5;
  String weatherIcon6;
  String weatherIcon7;
  String weatherMessage;
  String weatherDescription;
  String getSearchedCity;
  String time1;
  String time2;
  String time3;
  String time4;
  String time5;
  String time6;
  String time7;

  WeatherModel weatherModel = WeatherModel();

  void updateLocationUI(dynamic weatherData) {
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
    var condition = weatherData['weather'][0]['id'];
    weatherIcon = weatherModel.getWeatherIcon(condition);
    cityName = weatherData['name'];
    weatherDescription = weatherData['weather'][0]['description'];
  }

  void update5DayListUI(dynamic weatherData) {
    if (weatherData == null) {
      temperture = 0;
      weatherIcon = 'Error';
      weatherMessage = 'Unable to get weather data';
      cityName = '';
      return; // return ends the method.
    }

    double temp1 = weatherData['list'][0]['main']['temp'];
    temperture1 = temp1.toInt();
    double temp2 = weatherData['list'][1]['main']['temp'];
    temperture2 = temp2.toInt();
    double temp3 = weatherData['list'][2]['main']['temp'];
    temperture3 = temp3.toInt();
    double temp4 = weatherData['list'][3]['main']['temp'];
    temperture4 = temp4.toInt();
    double temp5 = weatherData['list'][4]['main']['temp'];
    temperture5 = temp5.toInt();
    double temp6 = weatherData['list'][5]['main']['temp'];
    temperture6 = temp6.toInt();
    double temp7 = weatherData['list'][6]['main']['temp'];
    temperture7 = temp7.toInt();
    var condition1 = weatherData['list'][0]['weather'][0]['id'];
    weatherIcon = weatherModel.getWeatherIcon(condition1);
    var condition2 = weatherData['list'][1]['weather'][0]['id'];
    weatherIcon2 = weatherModel.getWeatherIcon(condition2);
    var condition3 = weatherData['list'][2]['weather'][0]['id'];
    weatherIcon3 = weatherModel.getWeatherIcon(condition3);
    var condition4 = weatherData['list'][3]['weather'][0]['id'];
    weatherIcon4 = weatherModel.getWeatherIcon(condition4);
    var condition5 = weatherData['list'][4]['weather'][0]['id'];
    weatherIcon5 = weatherModel.getWeatherIcon(condition5);
    var condition6 = weatherData['list'][5]['weather'][0]['id'];
    weatherIcon5 = weatherModel.getWeatherIcon(condition6);
    var condition7 = weatherData['list'][6]['weather'][0]['id'];
    weatherIcon5 = weatherModel.getWeatherIcon(condition7);

    time1 = weatherData['list'][0]['dt_txt'];
    time2 = weatherData['list'][1]['dt_txt'];
    time3 = weatherData['list'][2]['dt_txt'];
    time4 = weatherData['list'][3]['dt_txt'];
    time5 = weatherData['list'][4]['dt_txt'];
    time6 = weatherData['list'][5]['dt_txt'];
    time7 = weatherData['list'][6]['dt_txt'];
    getSearchedCity = weatherData['city']['name'];
  }
}
