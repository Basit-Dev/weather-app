import 'weather.dart';

class UpdateWeatherData {
  int temperture;
  String cityName;
  String weatherIcon;
  String weatherMessage;

  WeatherModel weatherModel = WeatherModel();

  // We use dynamic as type because weatherData is a var.
  void updateUI(dynamic weatherData) {
    // 3. lon/lat stored in weatherData from push
    // 8A city stored in weatherData from cityWeatherData
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
  }
}
