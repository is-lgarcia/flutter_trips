import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertrips/floating_action_button_green.dart';

class CardImageProfile extends StatelessWidget{

  String pathImage = "assets/images/beach.jpg";
  String title = "Mountain Range";
  String description = "Es un lugar muy muy muy bonito con una vegetación muy varidad donde te puedes...";
  String steps = "Steps 123,456,789";

  CardImageProfile(this.pathImage, this.title, this.description, this.steps);

  @override
  Widget build(BuildContext context) {

    final card = Container(
      height: 230.0,
      width: 355.0,
      margin: EdgeInsets.only(
          top: 20.0,
          left: 20.0,
          bottom: 40.0
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(pathImage)
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0)
            )
          ]
      ),
    );

    final cardContent = Container(
      height: 110,
      width: 230,
      margin: EdgeInsets.only(
        top: 170,
        left: 90
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 15.0,
            offset: Offset(0.0, 7.0)
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: "Lato",
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                color: Colors.black
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10.0
            ),
            child: Text(
              description,
              style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 11.0,
                  color: Colors.black38
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 10.0,
                left: 10.0,
                right: 10.0
            ),
            child: Text(
              steps,
              style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.orangeAccent
              ),
            ),
          ),
        ],
      ),
    );

    // TODO: implement build
    return Stack(
      //alignment: Alignment(0.9,1.1),
      children: <Widget>[
        card,
        Stack(
          alignment: Alignment(0.9,1.2),
          children: <Widget>[
            cardContent,
            FloatingActionButtonGreen(),
          ],
        )
      ],
    );
  }

}