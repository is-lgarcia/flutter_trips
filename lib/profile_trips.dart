import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertrips/boxbuttons.dart';
import 'package:fluttertrips/header_appbar_profile.dart';

class ProfileTrips extends StatelessWidget{
  @override
  Widget build(BuildContext context) {


    return Stack(
      children: <Widget>[
        HeaderAppbarProfile(),
        BoxButtons(),

      ],
    );
  }

}