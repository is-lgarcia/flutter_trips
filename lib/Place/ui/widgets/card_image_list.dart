import 'package:flutter/material.dart';
import 'package:fluttertrips/Place/ui/widgets/card_image.dart';

class CardImageList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    double width = 270.0;
    double height = 210.0;
    double left = 10.0;

    return Container(
      height: 350.0,
      child: ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImageWithFabIcon(pathImage: "assets/images/beach.jpg", width: width , height: height, left: left, onPressFabIcon: null, iconData: Icons.favorite_border),
        ],
      ),
    );
  }

}