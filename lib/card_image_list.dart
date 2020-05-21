import 'package:flutter/material.dart';
import 'package:fluttertrips/card_image.dart';

class CardImageList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 350.0,
      child: ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImage("assets/images/beach.jpg"),
          CardImage("assets/images/image.jpg"),
          CardImage("assets/images/lake.jpg"),
          CardImage("assets/images/lake_dos.jpg"),
          CardImage("assets/images/montain.jpg"),
          CardImage("assets/images/snow.jpg")
        ],
      ),
    );
  }

}