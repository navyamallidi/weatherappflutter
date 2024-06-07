import 'package:flutter/material.dart';
import 'package:weatherapp/pages/home.dart';
import 'package:weatherapp/pages/location.dart';
import 'package:weatherapp/pages/loading.dart';


void main() {
  runApp( MaterialApp(
    routes: {
      "/" : (context) =>  Loading(),
      "/home": (context) =>  Home(),
    },
    debugShowCheckedModeBanner: false,
  ));
}


