import 'package:flutter/material.dart';
import 'package:fluttertrips/card_image_list.dart';
import 'package:fluttertrips/gradient_back.dart';

class HeaderAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        GradienteBack("Bienvenido"),
        CardImageList(),
      ],
    );

  }

}