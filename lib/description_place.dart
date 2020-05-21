import 'package:flutter/material.dart';
import 'package:fluttertrips/button_purple.dart';

class DescriptionPlace extends StatelessWidget{

  String namePlace;
  int stars;
  String descriptionPlace;

  //Metodo Constructor
  DescriptionPlace(this.namePlace, this.stars, this.descriptionPlace);

  @override
  Widget build(BuildContext context) {

    //Widget para Puntuaciones de 0.5
    final start_half = Container(
        margin: EdgeInsets.only(
            top: 323.0,
            right: 3.0
        ),
        child: Icon(
          Icons.star_half,
          color: Color(0xFFf2c611),
        )
    );

    //Widget para Puntuaciones de 0.0
    final start_border = Container(
        margin: EdgeInsets.only(
            top: 323.0,
            right: 3.0
        ),
        child: Icon(
          Icons.star_border,
          color: Color(0xFFf2c611),
        )
    );

    //Wifget de las estrellas
    final star = Container(
      margin: EdgeInsets.only(
        top: 323.0,
        right: 3.0
      ),
      child: Icon(
        Icons.star,
        color: Color(0xFFf2c611),
      )
    );

    //Widget del titulo + estrellas
    final title_starts = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 320.0,
            left: 20.0,
            right: 20.0
          ),

          child: Text(
            namePlace,
            style: TextStyle(
              fontFamily: "Lato",
              fontSize: 30.0,
              fontWeight: FontWeight.w900
            ),
            textAlign: TextAlign.left,
          ),

        ),

        Row(
          children: <Widget>[
            star,
            star,
            star,
            start_half,
            start_border
          ],
        )
      ],
    );

    final description_place = Container(
      margin: EdgeInsets.only(
        top: 10.0,
        left: 20.0,
        right: 20.0
      ),
      child: Text(
        descriptionPlace,
        style: TextStyle(
          fontFamily: "Lato",
          fontSize: 13.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFF56575a)
        ),
        textAlign: TextAlign.justify,
      ),
    );

    //Uniendo los Widget title_start con description
    final title_start_description = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          title_starts,
          description_place,
          ButtonPurple("Navigate")
        ],
      ),
    );

    return title_start_description;
  }

}