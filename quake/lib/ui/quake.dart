import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Quake extends StatefulWidget {
  var _data;

  Quake(this._data);

  @override
  State<StatefulWidget> createState() => new QuakeState(_data);
}

class QuakeState extends State<Quake> {
  // https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson


//      "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson";
  var _data;


  QuakeState(this._data);

  @override
  Widget build(BuildContext context) {
//    debugPrint(_data['features'].runtimeType.toString());

    List earthquakes = _data['features'];
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Quakes - USGS All Earthquakes"),
          backgroundColor: Colors.red,
          centerTitle: true,
        ),
        body: new ListView.builder(
            itemCount: earthquakes.length,
            itemBuilder: (BuildContext context, int index) {
              print("${earthquakes[index]}");

              var earthquake = earthquakes[index];
              var time = earthquake['properties']['time'];
              time *= 1000;

              //var dateTime = new DateTime.fromMillisecondsSinceEpoch(int.parse(time));
              //time = new DateFormat.yMMMMd(dateTime).add_jm();
              return new ListTile(
                title: new Text(time ?? "Empty"),
              );
            }));
  }
}

Future<Map> getJson(String url) async {
  return await http.get(url).then((response) => json.decode(response.body));
}
