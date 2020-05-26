import 'package:flutter/material.dart';
import 'package:fluttertrips/gradient_back.dart';
import 'package:fluttertrips/info_profile.dart';

import 'gradient_back_profile.dart';

class HeaderAppbarProfile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        GradientBackProfile("Perfil"),
        InfoProfile(),
      ],
    );
  }

}