import 'package:flutter/material.dart';
import 'package:fluttertrips/review_list.dart';

import 'description_place.dart';
import 'headet_appbar.dart';
import 'main.dart';

class Hometrips extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              DescriptionPlace('Duwili Ella', 4, MyApp().descriptionDummy),
              ReviewList()
            ],
          ),
          HeaderAppBar(),
        ]
    );
  }

}