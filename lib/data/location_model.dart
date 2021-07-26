import 'package:geolocator/geolocator.dart';

class LocationModel{
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async{
    try {
      Position position = await Geolocator.
      getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print(position);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch(e) {
      print('error');
    }
  }
}