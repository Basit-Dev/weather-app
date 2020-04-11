import 'package:geolocator/geolocator.dart';

/// This class is used to get the location of the device.
class Location {
  double latitude;
  double longitude;

  // 4. Gets current location with a catch exemption and stores the values in lat/lon.
  // Position will only receive the data once Geolocator receives the lat/lon values as its a await type, then it will store it in lon and lat.
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}
