import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class Network {
  final String url;
  Network(this.url);

  Future<dynamic> getJsonData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
    else {
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