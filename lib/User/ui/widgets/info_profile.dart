import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoProfile extends StatelessWidget{

  String pathImage = "assets/images/photo_example.jpg";
  String nameProfile = "Luis García";
  String emailProfile = "luis10.g@hotmail.com";

  @override
  Widget build(BuildContext context) {



    final photoProfile = Container(
      margin: EdgeInsets.only(
          top: 100.0,
          left: 20.0
      ),

      width: 100.0,
      height: 100.0,

      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(pathImage),
          )
      ),
    );

    final username = Container(
      margin: EdgeInsets.only(
        top: 125.0,
        left: 140.0
      ),
      child: Text(
          nameProfile,
      style: TextStyle(
        fontFamily: "Lato",
        fontSize: 18.0,
        color: Colors.white,
        fontWeight: FontWeight.bold
      ),),
    );

    final emailContact = Container(
      margin: EdgeInsets.only(
        top: 5.0,
        left: 140.0
      ),
      child: Text(
        emailProfile,
        style: TextStyle(
          fontFamily: "Lato",
          color: Colors.white70
        ),
      ),
    );
    // TODO: implement build
    return Stack(
      children: <Widget>[
        photoProfile,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[
           username,
           emailContact
         ],
        )
      ],
    );
  }

}