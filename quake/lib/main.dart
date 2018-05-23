import 'package:flutter/material.dart';
import './ui/quake.dart';

main(List<String> arguments) async {
  final String url = "http://10.0.2.2:8000/all_day.geojson";
  getJson(url).then((data){
    runApp(new MaterialApp(
      title: "Quake",
      home: new Quake(data),
    ));
  });

}