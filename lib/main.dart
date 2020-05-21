import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertrips/gradient_back.dart';
import 'package:fluttertrips/headet_appbar.dart';
import 'package:fluttertrips/review_list.dart';

import 'description_place.dart';
import 'flutter_trips.dart';

void main() {
  //Para poner la barra de notificaciones transparente
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light
    )
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String descriptionDummy =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas commodo mauris vitae sollicitudin dapibus. Etiam aliquet eros id suscipit congue. Quisque sodales velit in pharetra malesuada. In dictum porta tempus. Donec sed odio feugiat, egestas libero nec, cursus mi. Sed pharetra vehicula turpis, eu lobortis lectus ultrices accumsan. Fusce pretium posuere massa, sed pretium massa consequat consectetur. Morbi bibendum velit ac ipsum fringilla dignissim. Fusce est libero, gravida vitae diam et, volutpat rutrum ex. Sed euismod odio vel eros pharetra interdum. In dignissim, nulla at blandit hendrerit, enim dolor volutpat nisl, eu finibus diam mi eget dui. Morbi vel erat dui. Praesent facilisis ligula auctor neque lacinia dictum. Cras pulvinar volutpat dui, eget facilisis elit varius vel. ';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlutterTrips()
    );
  }
}
