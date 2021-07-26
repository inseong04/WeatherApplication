import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      Fluttertoast.showToast(
          msg: "에러가 발생했습니다.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }
}