import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/luis1/Documents/AplicacionesFlutter/flutter_trips/lib/User/ui/widgets/boxbuttons.dart';
import 'file:///C:/Users/luis1/Documents/AplicacionesFlutter/flutter_trips/lib/User/ui/widgets/card_image_profile.dart';
import 'file:///C:/Users/luis1/Documents/AplicacionesFlutter/flutter_trips/lib/User/ui/screens/header_appbar_profile.dart';

class ProfileTrips extends StatelessWidget{
  @override
  Widget build(BuildContext context) {


    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 300.0
          ),
          child: Center(
            child: ListView(
              children: <Widget>[
                CardImageProfile("assets/images/beach.jpg"
                    ,"A la Beach con Joan","Este era un programa de radio que entretenia a los jovenes de El Salvador "
                    ,"Steps 123,456,789"),
                CardImageProfile("assets/images/lake.jpg"
                    ,"A la Beach con Joan","Este era un programa de radio que entretenia a los jovenes de El Salvador "
                    ,"Steps 123,456,789"),
              ],
            ),
          ),
        ),
        HeaderAppbarProfile(),
        BoxButtons(),

      ],
    );
  }

}